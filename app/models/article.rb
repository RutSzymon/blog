class Article < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :comments

  attr_accessible :body, :summary, :title, :category_id

  validates :title, presence: true
  validates :summary, presence: true
  
  paginates_per 10

  scope :top, ->(num){ order("comments_count DESC").limit(num) }
end
