class FacturasController < ApplicationController
  def index
    @facturas = Factura.all.order(nro: :desc)
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render template: 'carts/lista', pdf: "Lista de pedidos" # Excluding ".pdf" extension.
    #   end
    # end
  end

  def show
    @factura = Factura.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'facturas/factura', pdf: "#{@factura.razon_social}" # Excluding ".pdf" extension.
      end
    end
  end

  def create
    @factura = Factura.new(factura_params)
    @cart = Cart.find(params[:cart_id])
    @factura.cart = @cart
    @factura.user_id = current_user.id
    @factura.cliente_id = @cart.cliente_id || 1
    if Factura.last.nil?
      @factura.nro = 5
    else
      @factura.nro = Factura.last.nro.to_i + 1
    end
    @factura.save
    @cart.cart_items.where(status: "added").each do |items|
      movimiento = MovItem.new(
        quantity: items.quantity.to_i,
        status: "salida",
        item_id: items.item_id,
        costo: items.item.cost_price,
        precio: items.price,
        factura: @factura
        )
      movimiento.save
      item = Item.find(items.item_id)
      item.stock -= movimiento.quantity
      item.save
      total = @factura.total.to_i
      totatilu = total + (items.quantity.to_i * items.price)
      @factura.total = totatilu.to_s
      @factura.save
    end
    @factura.date = Date.today
    @factura.email = @factura.cart.email
    @factura.razon_social = @factura.cart.razon_social
    @factura.ruc = @factura.cart.ruc
    @factura.pagado = 0
    @factura.saldo = @factura.total.to_i - @factura.pagado
    @cart.status = "facturado"
    @cart.save
    if @factura.save
      redirect_to facturas_path
    end
  end

  def pago
    pago = Pago.new(factura_id: params[:factura_id])
    pago.status = "recibido" #o emitido
    pago.save
    tipo_pago = TipoPago.new(pago_id: pago,)
    raise
  end

  private

  def factura_params
    params.require(:factura).permit(:date, :condicion)
  end
end
