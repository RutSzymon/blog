class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body
  validates :body, presence: true
  validates :article, presence: true
end
