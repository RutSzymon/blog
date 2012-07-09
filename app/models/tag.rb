class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles

  attr_accessible :title, as: :admin  

  validates :title, presence: true
  
  paginates_per 10
  
end
