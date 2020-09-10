json.array! @clientes do |cliente|
  json.extract! cliente, :id, :name
end
