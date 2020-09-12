class UbicacionsController < ApplicationController
  def create
    @ubicacion = Ubicacion.new(ubicacion_delcliente)
    @ubicacion.cliente_id = params[:cliente_id]
    redirect_to cliente_path(@ubicacion.cliente) if @ubicacion.save
  end

  def edit
    @ubicacion = Ubicacion.find(params[:id])
  end

  def update
    @ubicacion = Ubicacion.find(params[:id])
    redirect_to cliente_path(@ubicacion.cliente) if @ubicacion.update(ubicacion_delcliente)
  end

  private

  def ubicacion_delcliente
    params.require(:ubicacion).permit(:name, :latitud, :link, :longitud, :ciudad, :zona, :obs)
  end
end
