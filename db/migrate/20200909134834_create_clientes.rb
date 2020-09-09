class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :razon_social
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
