class AddMapToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :map, :string
  end
end
