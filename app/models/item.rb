class Item < ApplicationRecord
  has_many :cart_items
  has_many :mov_items
end
