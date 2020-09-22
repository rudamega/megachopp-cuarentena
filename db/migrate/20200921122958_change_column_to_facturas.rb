class ChangeColumnToFacturas < ActiveRecord::Migration[6.0]
  def change
    change_column :facturas, :total, :integer, using: 'total::integer'
  end
end
