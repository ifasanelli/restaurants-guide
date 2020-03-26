class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :restaurant, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
