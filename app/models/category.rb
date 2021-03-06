class Category < ActiveRecord::Base
  has_many :articles

  attr_accessible :title

  validates :title, presence: true

  paginates_per 10

  def to_s
    title
  end
end
