class Article < ActiveRecord::Base
  acts_as_taggable

  belongs_to :category
  has_many :comments

  attr_accessible :body, :summary, :title, :category_id

  validates :title, presence: true
  validates :summary, presence: true
  
  paginates_per 10

  scope :top, ->(num){ order("comments_count DESC").limit(num) }

  def self.with_category(category)
    if category
      where(category_id: category)
    else
      scoped
    end
  end

  def self.with_tag(tag)
    if tag
      tagged_with(tag)
    else
      scoped
    end
  end
end
