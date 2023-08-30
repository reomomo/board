class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes, dependent: :destroy
  has_many :vote_answers # 理事が退会しても集計結果は残す為、dependent: :destroyはしない
  has_many :public_relations # 理事が変わっても広報は残す為、dependent: :destroyはしない
  has_many :participants, dependent: :destroy

  enum is_participated: { unselected: 0, attendance: 1, absence: 2 }

end
