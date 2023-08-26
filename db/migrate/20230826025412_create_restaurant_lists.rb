class CreateRestaurantLists < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_lists do |t|
      t.string :name, mull: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
