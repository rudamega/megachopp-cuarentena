class CreateUbicacions < ActiveRecord::Migration[6.0]
  def change
    create_table :ubicacions do |t|
      t.string :name
      t.string :latitud
      t.string :longitud
      t.string :obs
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
