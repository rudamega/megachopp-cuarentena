json.array! @entregados do |cart|
  json.extract! cart, :id, :date, :status, :lugar, :cliente, :razon_social, :latitud, :longitud, :ciudad, :cart_items
end
