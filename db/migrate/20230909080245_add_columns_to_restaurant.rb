class AddColumnsToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :lat, :float
    add_column :restaurants, :lng, :float
    add_column :restaurants, :place_id, :string
    add_column :restaurants, :rating, :float
    add_column :restaurants, :user_ratings_total, :integer
    add_column :restaurants, :photos, :text
    add_column :restaurants, :types, :text
  end
end
