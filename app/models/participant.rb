class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :public_reraltion
end
