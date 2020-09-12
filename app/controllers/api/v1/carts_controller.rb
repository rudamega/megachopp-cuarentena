class Api::V1::CartsController < Api::V1::BaseController
  before_action :set_confirmado, only: [:confirmado]
  before_action :set_entregado, only: [:entregado]

  def index
    @carts = policy_scope(Cart)
  end

  def confirmado
  end

  def entregado
  end

  private

  def set_confirmado
    @confirmados = Cart.where(["status = ? and show = ?", "confirmado", "si"])
    authorize @confirmados
  end

  def set_entregado
    @entregados = Cart.where(["status = ? and show = ?", "entregado", "si"])
    authorize @entregados
  end
end
