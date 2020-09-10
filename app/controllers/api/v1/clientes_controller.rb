class Api::V1::ClientesController < Api::V1::BaseController
  before_action :set_user, only: [:show]

  def index
    @clientes = policy_scope(Cliente)
  end

  def show
  end

  private

  def set_user
    @user = Clientes.find(params[:id])
    authorize @user
  end
end
