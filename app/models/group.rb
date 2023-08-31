class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
  accepts_nested_attributes_for :group_users
  has_many :public_relations # グループが削除されたら広報はグループ：その他へ移動させる為、dependent: :destroyはしない
  has_many :votes # グループが削除されたらアンケートはグループ：その他へ移動させる為、dependent: :destroyはしない
end
