json.array! @carts do |cart|
  json.cart do
    json.extract! cart, :id, :status, :date, :razon_social, :latitud, :longitud, :ciudad, :cart_items
  end
end
