class RemoveDateFromFacturas < ActiveRecord::Migration[6.0]
  def change
    remove_column :facturas, :date, :string
  end
end
