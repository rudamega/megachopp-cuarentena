class AddDateToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :date, :date
  end
end
