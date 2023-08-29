class VoteAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  validates :choice, presence: true
  validates :answer, presence: true
  validates :email, presence: true, uniqueness: true
end
