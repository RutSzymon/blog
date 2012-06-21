class Category < ActiveRecord::Base
  has_many :articles

  attr_accessible :title
  
  validates :title, presence: true
  
end
