class AddShowTocarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :show, :string, default: "no"

  end
end
