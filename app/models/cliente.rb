class Cliente < ApplicationRecord
  has_many :ubicacions
  has_many :facturas
  validates :name, :ruc, :razon_social, :tel, presence: true
end
