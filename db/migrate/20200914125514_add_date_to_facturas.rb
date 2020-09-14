class AddDateToFacturas < ActiveRecord::Migration[6.0]
  def change
    add_column :facturas, :date, :date
  end
end
