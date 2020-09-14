class AddPagadoToFacturas < ActiveRecord::Migration[6.0]
  def change
    add_column :facturas, :pagado, :integer
    add_column :facturas, :saldo, :integer
  end
end
