class Restaurant < ApplicationRecord
  validates :name, presence: true
  serialize :photos, Array
  serialize :types, Array

  has_many :list_bookmarks, dependent: :destroy
  has_many :restaurant_lists, through: :list_bookmarks
end
