class AddLugarToUbicacions < ActiveRecord::Migration[6.0]
  def change
    add_column :ubicacions, :link, :string
  end
end
