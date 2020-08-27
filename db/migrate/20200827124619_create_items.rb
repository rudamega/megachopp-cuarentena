class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :cost_price
      t.integer :sales_prices
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
