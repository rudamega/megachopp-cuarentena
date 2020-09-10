json.extract! @cliente, :id, :name, :email, :ruc, :tel, :razon_social
json.ubicacions @cliente.ubicacions do |ubicacion|
  json.extract! ubicacion, :id, :cliente_id, :name, :latitud, :longitud, :obs, :ciudad
end
