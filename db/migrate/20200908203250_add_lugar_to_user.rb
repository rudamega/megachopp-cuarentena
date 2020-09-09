class AddLugarToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lugar, :string
    add_column :users, :latitud, :string
    add_column :users, :longitud, :string
  end
end
