class AddColumnToMovItems < ActiveRecord::Migration[6.0]
  def change
    add_column :mov_items, :status, :string
    add_column :mov_items, :costo, :integer
    add_column :mov_items, :precio, :integer
  end
end
