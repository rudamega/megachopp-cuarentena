class Factura < ApplicationRecord
  belongs_to :user
  belongs_to :cliente
  belongs_to :cart
  has_many :mov_items, dependent: :destroy
  validates :condicion, presence: true
end
