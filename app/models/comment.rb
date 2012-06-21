class Comment < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :user

  attr_accessible :body
  attr_accessible :body, :article_id, as: :admin

  validates :body, presence: true
  validates :article, presence: true
  validates :user, presence: true
end
