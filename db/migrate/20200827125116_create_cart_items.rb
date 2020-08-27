class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.string :status
      t.string :quantity
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
