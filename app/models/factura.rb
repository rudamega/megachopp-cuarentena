class Factura < ApplicationRecord
  belongs_to :user
  belongs_to :cliente
  belongs_to :cart
end
