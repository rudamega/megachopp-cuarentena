class AddTel2ToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :name2, :string
    add_column :clientes, :tel2, :string
  end
end
