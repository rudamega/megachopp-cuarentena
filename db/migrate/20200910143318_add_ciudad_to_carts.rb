class AddCiudadToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :ciudad, :string
    add_column :carts, :zona, :string
  end
end
