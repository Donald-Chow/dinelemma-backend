class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :vote_session
  belongs_to :restaurant

  enum result: %i[yes no super]
end
