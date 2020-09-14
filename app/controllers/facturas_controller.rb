class FacturasController < ApplicationController
  def index
    @facturas = Factura.all.order(date: :asc)
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render template: 'carts/lista', pdf: "Lista de pedidos" # Excluding ".pdf" extension.
    #   end
    # end
  end

  def create
    @factura = Factura.new(factura_params)
    @factura.save
    @factura.user_id = current_user.id
    @cart = Cart.find(params[:cart_id])
    @factura.cart = @cart
    @factura.date = Date.today
    @factura.nro = 1
    @factura.cliente_id = @cart.cliente_id || 1
    @factura.email = @factura.cart.email
    @factura.razon_social = @factura.cart.razon_social
    @factura.ruc = @factura.cart.ruc
    @factura.save
    @cart.save
    redirect_to facturas_path
  end

  private

  def factura_params
    params.require(:factura).permit(:date, :condicion)
  end
end
