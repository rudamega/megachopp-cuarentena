class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(clientes_params)
    if @cliente.save
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
    params.require(:cliente).permit(:name, :razon_social, :tel, :email, :cliente, :ruc)
  end
end
