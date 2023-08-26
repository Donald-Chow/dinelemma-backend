class CreateListBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :list_bookmarks do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :restaurant_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
