class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 理事が退会してもデータを残したい。退会方法を変更するか検討中
  has_many :votes, dependent: :destroy
  has_many :vote_answers, dependent: :destroy
  has_many :public_relations, dependent: :destroy

  # has_many :votes # 理事が退会しても集計結果は残す為、dependent: :destroyはしない
  # has_many :vote_answers # 理事が退会しても集計結果は残す為、dependent: :destroyはしない
  # has_many :public_relations # 理事が変わっても広報は残す為、dependent: :destroyはしない


  has_many :groups, through: :group_users
  has_many :group_users, dependent: :destroy

  enum is_participated: { unselected: 0, attendance: 1, absence: 2 }

  def full_name
    self.last_name + " " + self.first_name
  end

end
