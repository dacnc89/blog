class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true, length: {minimum: 50}
  
  def self.search(search_params)
    if search_params
      where('title || text LIKE ?', "%#{search_params}%").order('created_at DESC')
    else
      order('id ASC')
    end
  end
end

