class Cliente < ApplicationRecord
  has_many :ubicacions
  validates :name, :ruc, :razon_social, :tel, presence: true
end
