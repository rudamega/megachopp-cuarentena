json.array! @confirmados do |cart|
  json.extract! cart, :id, :status, :lugar, :cliente, :razon_social, :latitud, :longitud, :ciudad, :cart_items
end
