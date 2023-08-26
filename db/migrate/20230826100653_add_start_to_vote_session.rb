class AddStartToVoteSession < ActiveRecord::Migration[7.0]
  def change
    add_column :vote_sessions, :start, :boolean, default: false
  end
end
