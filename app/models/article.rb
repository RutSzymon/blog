class Article < ActiveRecord::Base
  has_many :comments
  attr_accessible :body, :summary, :title
  validates :title, presence: true
  validates :summary, presence: true
  paginates_per 10

  scope :top, ->(num){ order("comments_count DESC").limit(num) }
end
