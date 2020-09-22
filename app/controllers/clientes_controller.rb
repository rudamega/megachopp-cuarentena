

class ClientesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR razon_social ILIKE :query"
      @clientes = Cliente.where(sql_query, query: "%#{params[:query]}%")
    else
      @clientes = Cliente.all.order(id: :desc).limit(50)
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
    @ubicaciones = Ubicacion.where(cliente: @cliente)
    @ubicacion = Ubicacion.new
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(clientes_params)
    if @cliente.save
      url = "https://fcm.googleapis.com/fcm/send"
      body = {
        notification: {
          title: "Se ha adicionado un nuevo Cliente",
          body: "Nombre: #{@cliente.name}"
        },
        priority: "high",
        data: {
          click_action: "FLUTTER_NOTIFICATION_CLICK",
          id: "1",
          status: "done",
          cliente: "ruben"
        },
        to:
        "eswcJYcCSbSt8A_0ptsBH4:APA91bEeL4UDj4Wd8yN3httSm9Tjw1obejoR7RReNL_thYD5GqEbg2XFyHXH1d_PlgCZdjBE6wYGSo8zZNW17MU__I5LRUSqRm2ILWtuvw5e41oDfW7iMsT1HFdHEJxtnsac6WgE6NGW"
      }

      response = RestClient::Request.new({
        method: :post,
        url: "https://fcm.googleapis.com/fcm/send",
        payload: body.to_json,
        headers: {content_type: 'application/json', Authorization: "key=#{ENV['FIREBASE']}"}
         }).execute
      redirect_to cliente_path(@cliente)
    else
    render 'new'
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    @cliente.update(clientes_params)
    redirect_to cliente_path(@cliente)
  end

  private

  def clientes_params
    params.require(:cliente).permit(:name, :razon_social, :tel, :email, :cliente, :ruc, :date)
  end
end
