class AddRazonToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :razon_social, :string
  end
end
