class AddLugartoUbicacions < ActiveRecord::Migration[6.0]
  def change
    add_column :ubicacions, :ciudad, :string
    add_column :ubicacions, :zona, :string
  end
end
