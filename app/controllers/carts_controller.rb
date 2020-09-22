class CartsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "cliente ILIKE :query OR razon_social ILIKE :query"
      @carts = Cart.where(sql_query, query: "%#{params[:query]}%")
    else
      @carts = Cart.all.order(date: :desc)
      respond_to do |format|
        format.html
        format.pdf do
          render template: 'carts/lista', pdf: "Lista de pedidos" # Excluding ".pdf" extension.
        end
      end
    end
  end

  def show
    @cart = Cart.find(params[:id])
    @cart_item = CartItem.new
    @cart_cart_consi = CartItem.new
    @items = Item.all
    @cart_item_cart = CartItem.where("cart_id = ?", @cart.id).order(created_at: :asc)
  end

  def mostrar
    @cart = Cart.find(params[:id])
    if @cart.status == "facturado"
      @facturas = Factura.where(cart: @cart)
    end
    @lugar = @cart.lugar
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'carts/pdf', pdf: "#{@cart.cliente}" # Excluding ".pdf" extension.
      end
    end
    @factura = Factura.new
  end

  def cambiar
    @cart = Cart.find(params[:id])
  end

  def mapa

  end

  def mapa_si
    @cart = Cart.find(params[:cart_id])
    @cart.show = "si"
    redirect_to carts_path if @cart.save
  end

  def mapa_no
    @cart = Cart.find(params[:cart_id])
    @cart.show = "no"
    redirect_to carts_path if @cart.save
  end

  def new
    @cart = Cart.new
  end

  def create
    if Cart.where("user_id = ?", current_user.id).last.nil?
      @cart = Cart.new(user_id: current_user.id, date: "")
      redirect_to cart_path(@cart.id) if @cart.save
    else
      if Cart.where("user_id = ?", current_user.id).last.status != "open"
        @cart = Cart.new(user_id: current_user.id, date: "")
        redirect_to cart_path(@cart.id) if @cart.save
      else
        redirect_to cart_path(Cart.where('user_id = ?', current_user.id).last.id)
        return
      end
    end
  end

  def cart_confirmado
    @cart = Cart.find(params[:cart_id])
    added = "added"
    @cart_items = CartItem.where("cart_id = ? AND status = ?", @cart.id, added)
    unless @cart_items.empty?
      @cart_items.each do |item|
        item.status = "added"
        item.save
      end
      @cart.status = "confirmado"
      @cart.save
      redirect_to edit_cart_path(@cart)
      return
    end
    redirect_to pages_path
  end

  def edit
    @cart = Cart.find(params[:id])
    @users = User.all
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(carts_params)
      # body = {
      #   notification: {
      #     title: "Nuevo pedido para #{@cart.cliente}",
      #     body: "Fecha: #{@cart.date}"
      #   },
      #   priority: "high",
      #   data: {
      #     click_action: "FLUTTER_NOTIFICATION_CLICK",
      #     id: "1",
      #     status: "done",
      #     nombre: @cart.cliente,
      #     cliente: @cart.cliente,
      #     fecha: @cart.date
      #   },
      #   to:
      #   "eswcJYcCSbSt8A_0ptsBH4:APA91bEeL4UDj4Wd8yN3httSm9Tjw1obejoR7RReNL_thYD5GqEbg2XFyHXH1d_PlgCZdjBE6wYGSo8zZNW17MU__I5LRUSqRm2ILWtuvw5e41oDfW7iMsT1HFdHEJxtnsac6WgE6NGW"
      # }

      # response = RestClient::Request.new({
      #   method: :post,
      #   url: "https://fcm.googleapis.com/fcm/send",
      #   payload: body.to_json,
      #   headers: {content_type: 'application/json', Authorization: "key=#{ENV['FIREBASE']}"}
      #    }).execute
      # if @cart.email != ""
      # mail = UserMailer.with(cart: @cart).confirmado
      # mail.deliver_later
      # end
      redirect_to carts_path
    end
  end

  def destroy
  end

  private

  def carts_params
    params.require(:cart).permit(:date, :status, :email, :tel, :latitud, :longitud, :ruc, :cliente, :razon_social, :cliente_id, :lugar, :obs)
  end
end
