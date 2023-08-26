class VoteSession < ApplicationRecord
  belongs_to :group
  belongs_to :restaurant_list
  belongs_to :restaurant
end
