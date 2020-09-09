class AddRucToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :ruc, :string
  end
end
