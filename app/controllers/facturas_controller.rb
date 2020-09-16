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

  def create
    @factura = Factura.new(factura_params)
    @cart = Cart.find(params[:cart_id])
    @factura.cart = @cart
    @factura.user_id = current_user.id
    @factura.cliente_id = @cart.cliente_id || 1
    @factura.save
    @cart.cart_items.where(status: "added").each do |items|
      item = Item.find(items.item_id)
      item.stock -= items.quantity.to_i
      item.save
      total = @factura.total.to_i
      totatilu = total + (items.quantity.to_i * items.price)
      @factura.total = totatilu.to_s
      @factura.save
    end
    @factura.date = Date.today
    @factura.nro = Factura.last.nro.to_i + 1
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

  private

  def factura_params
    params.require(:factura).permit(:date, :condicion)
  end
end
