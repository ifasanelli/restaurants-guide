class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :neighborhood
      t.string :city
      t.integer :status
      t.string :phone
      t.string :phone2
      t.decimal :cost
      t.string :timmings
      t.string :happy_hour
      t.boolean :coffee
      t.boolean :delivery
      t.boolean :ac
      t.boolean :wifi
      t.boolean :cards
      t.boolean :tickets
      t.boolean :outside
      t.boolean :club
      t.boolean :vegetarian
      t.references :cuisine, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
