class PublicRelation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :topics, dependent: :destroy
end
