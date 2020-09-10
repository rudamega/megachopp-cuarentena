class Api::V1::UbicacionsController < Api::V1::BaseController
  before_action :set_ubicacion, only: [:show]
  def index
    @ubicacions = policy_scope(Ubicacion)
  end

  def show
  end

  private

  def set_ubicacion
    @ubicacion = Ubicacion.find(params[:id])
    authorize @ubicacion
  end
end
