class AddClientesToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :cliente, foreign_key: true
  end
end
