class AddDateToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :date, :date
  end
end
