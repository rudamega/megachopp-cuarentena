json.array! @confirmados do |cart|
  json.extract! cart, :id, :status, :razon_social, :latitud, :longitud, :ciudad
end
