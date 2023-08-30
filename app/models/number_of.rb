class NumberOf < ApplicationRecord
  belongs_to :user
  belongs_to :public_relation # number_ofが先に登録されるので、public_relationのidは持たせない
end
