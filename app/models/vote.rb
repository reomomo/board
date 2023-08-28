class Vote < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 2, maximum: 20}
  validates :question, presence: true, length: {minimum: 2, maximum: 200}
  validates :choice, presence: true, length: {minimum: 1, maximum: 50}
  validates :answer, presence: true
end
