class CreateFacturas < ActiveRecord::Migration[6.0]
  def change
    create_table :facturas do |t|
      t.string :date
      t.string :nro
      t.string :razon_social
      t.string :ruc
      t.string :email
      t.string :condicion
      t.string :total
      t.references :user, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
