class Topic < ApplicationRecord
  belongs_to :category
  belongs_to :public_relation
end
