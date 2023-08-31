class PublicRelation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :participants, dependent: :destroy
  has_many :topics, dependent: :destroy
end
