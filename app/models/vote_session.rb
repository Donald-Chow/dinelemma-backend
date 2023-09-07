class VoteSession < ApplicationRecord
  belongs_to :group
  belongs_to :restaurant_list, optional: true
  belongs_to :restaurant, optional: true

  has_many :group_members, through: :group
  has_many :users, through: :group_members

  has_many :list_bookmarks, through: :restaurant_list
  has_many :list_restaurants, through: :list_bookmarks, source: :restaurant

  has_many :votes, dependent: :destroy

  before_validation :set_default_name

  private

  def set_default_name
    self.name = Time.now.strftime("%d %b %Y %R")
  end
end
