class AddPriceLevelToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :price_level, :integer
  end
end
