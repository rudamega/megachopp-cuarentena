json.array! @clientes do |cliente|
  json.extract! cliente, :id, :name, :ruc, :razon_social
end
