class AddRolToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rol, :string, default: "cliente"
  end
end
