class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true, length: {minimum: 50}
end

