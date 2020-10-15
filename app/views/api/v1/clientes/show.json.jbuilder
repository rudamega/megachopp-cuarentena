json.extract! @cliente, :id, :name, :email, :ruc, :tel, :razon_social, :name2, :tel2
json.ubicacions @cliente.ubicacions do |ubicacion|
  json.extract! ubicacion, :id, :cliente_id, :name, :latitud, :longitud, :obs, :ciudad
end
