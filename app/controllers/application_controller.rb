class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_tags

  def get_tags
    @tags ||= Article.tag_counts_on(:tags)
  end
end
