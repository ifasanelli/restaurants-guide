class CreateFullAds < ActiveRecord::Migration[5.2]
  def change
    create_table :full_ads do |t|
      t.string :name
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
