class AddTel2ToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :cliente2, :string
    add_column :carts, :tel2, :string
  end
end
