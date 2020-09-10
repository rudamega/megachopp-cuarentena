json.array! @ubicacions do |ubicacion|
  json.extract! ubicacion, :id, :name, :latitud, :longitud, :ciudad, :obs, :zona
end
