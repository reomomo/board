class Category < ApplicationRecord
  belongs_to :group
  has_many :topics, dependent: :destroy
end
