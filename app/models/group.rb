class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members

  has_many :vote_sessions, dependent: :destroy

  def admins
    users.joins(:group_members).where(group_members: { admin: true })
  end
end
