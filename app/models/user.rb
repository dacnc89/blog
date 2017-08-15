class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, :password_digest, presence: true
  validates :password, length: {minimum: 8}, on: :create
end 