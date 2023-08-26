class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :restaurant_lists, dependent: :destroy

  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members

  has_many :vote_sessions, through: :groups

  has_many :votes
end
