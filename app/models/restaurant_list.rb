class RestaurantList < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

  has_many :list_bookmarks, dependent: :destroy
  has_many :restaurants, through: :list_bookmarks
end
