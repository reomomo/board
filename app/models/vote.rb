class Vote < ApplicationRecord
  belongs_to :user
  has_many :vote_answers, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2, maximum: 20}
  validates :question, presence: true, length: {minimum: 2, maximum: 200}
  validates :choice_1, presence: true, length: {minimum: 1, maximum: 50}
  validates :choice_2, presence: true, length: {minimum: 1, maximum: 50}
  validates :choice_3, presence: true, length: {minimum: 1, maximum: 50}
  validates :choice_4, presence: true, length: {minimum: 1, maximum: 50}

end
