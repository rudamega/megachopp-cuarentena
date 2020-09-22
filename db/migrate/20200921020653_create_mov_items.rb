class CreateMovItems < ActiveRecord::Migration[6.0]
  def change
    create_table :mov_items do |t|
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :factura, null: false, foreign_key: true

      t.timestamps
    end
  end
end
