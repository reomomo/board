class VoteAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  validates :answer, presence: true
end
