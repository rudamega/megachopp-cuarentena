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
      flash[:notice] = "Se ha creado un nuevo cliente"
      NotificationJob.perform_later(@cliente.id)
      RestClient.post 'https://contalapp.com/cliente-rudamega/registrar.php', {nombre: @cliente.razon_social, documento: @cliente.ruc}
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
    params.require(:cliente).permit(:name, :razon_social, :tel, :email, :cliente, :ruc, :date, :name2, :tel2)
  end
end
