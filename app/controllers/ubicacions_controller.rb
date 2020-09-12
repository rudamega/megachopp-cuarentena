class UbicacionsController < ApplicationController
  def create
    @ubicacion = Ubicacion.new(ubicacion_delcliente)
    @ubicacion.cliente_id = params[:cliente_id]
    redirect_to cliente_path(@ubicacion.cliente) if @ubicacion.save
  end

  private

  def ubicacion_delcliente
    params.require(:ubicacion).permit(:name, :latitud, :longitud, :ciudad, :zona, :obs)
  end
end
