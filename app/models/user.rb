class User < ApplicationRecord
  authenticates_with_sorcery!

  # アソシエーション
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :likes, dependent: :destroy

  # バリデーション
  validates :name, uniqueness: true
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true, # パスワード確認を使用
  if: -> { new_record? || changes[:crypted_password]} #　新規登録とパスワード変更のときだけ発動
end
