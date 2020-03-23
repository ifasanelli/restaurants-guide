class RemoveLongitudeFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :longitude, :decimal
  end
end
