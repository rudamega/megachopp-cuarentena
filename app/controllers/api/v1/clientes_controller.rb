class Api::V1::ClientesController < Api::V1::BaseController
  before_action :set_cliente, only: [:show]

  def index
    @clientes = policy_scope(Cliente)
  end

  def show
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
    authorize @cliente
  end
end
