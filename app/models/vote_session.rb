class VoteSession < ApplicationRecord
  belongs_to :group
  belongs_to :restaurant_list
  belongs_to :restaurant

  has_many :group_members, through: :group
  has_many :user, through: :group_members
end
