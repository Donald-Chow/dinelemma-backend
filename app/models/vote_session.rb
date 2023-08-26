class VoteSession < ApplicationRecord
  belongs_to :group
  belongs_to :restaurant_list, optional: true
  belongs_to :restaurant, optional: true

  has_many :group_members, through: :group
  has_many :user, through: :group_members
end
