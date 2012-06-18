class Comment < ActiveRecord::Base
  belongs_to :article

  attr_accessible :body
  attr_accessible :body, :article_id, as: :admin

  validates :body, presence: true
  validates :article, presence: true
end
