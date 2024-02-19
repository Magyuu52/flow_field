class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,12}+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}
  validates :password_confirm, presence: true
  has_one_attached :image
end
