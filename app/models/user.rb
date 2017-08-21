class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, :password_digest, presence: true
  validates :password, length: {minimum: 8}, on: :create

  mount_uploader :avatar, AvatarUploader
end 
