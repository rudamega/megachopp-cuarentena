json.array! @entregados do |cart|
  json.extract! cart, :id, :status, :lugar, :razon_social, :latitud, :longitud, :ciudad, :cart_items
end