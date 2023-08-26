class ListBookmark < ApplicationRecord
  belongs_to :restaurant
  belongs_to :restaurant_list
end
