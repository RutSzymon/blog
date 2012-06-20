class Category < ActiveRecord::Base
  has_many :articles

  attr_accessible :article_id, :title
  
  validates :title, presence: true
  
end
