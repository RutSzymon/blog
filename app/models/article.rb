class Article < ActiveRecord::Base
  attr_accessible :body, :summary, :title
  validates :title, presence: true
  validates :summary, presence: true
end
