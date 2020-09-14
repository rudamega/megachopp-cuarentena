class AddtotalToFactura < ActiveRecord::Migration[6.0]
  def change
    add_column :facturas, :total, :string
  end
end
