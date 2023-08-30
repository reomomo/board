class PublicRelation < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :topics, dependent: :destroy
end
