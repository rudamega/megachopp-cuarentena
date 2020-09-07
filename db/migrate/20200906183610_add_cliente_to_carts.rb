class AddClienteToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :cliente, :string
    add_column :carts, :razon_social, :string
    add_column :carts, :ruc, :string
    add_column :carts, :email, :string
    add_column :carts, :tel, :string
    add_column :carts, :lugar, :string
    add_column :carts, :obs, :string
    add_column :carts, :sena, :string
    add_column :carts, :latitud, :string
    add_column :carts, :longitud, :string
    add_column :carts, :factura, :string
  end
end
