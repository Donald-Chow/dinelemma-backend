class CreateVoteSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :vote_sessions do |t|
      t.string :name, default: -> { "CURRENT_TIMESTAMP" }
      t.references :group, null: false, foreign_key: true
      t.references :restaurant_list, null: true, foreign_key: true
      t.references :restaurant, null: true, foreign_key: true

      t.timestamps
    end
  end
end
