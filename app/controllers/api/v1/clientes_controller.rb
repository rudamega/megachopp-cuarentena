class Api::V1::ClientesController < Api::V1::BaseController

  before_action :set_cliente, only: [:show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR razon_social ILIKE :query"
      @clientes = policy_scope(Cliente).where(sql_query, query: "%#{params[:query]}%")
    else
      @clientes = policy_scope(Cliente).order(id: :desc)
    end
  end

  def show
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
    authorize @cliente
  end
end
