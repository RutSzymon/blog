module ArticlesHelper
  include ActsAsTaggableOn::TagsHelper
  def previous_path(options = {})
    if !options[:category] && !options[:tag] && !options[:top]
      root_path
    elsif options[:tag]
      tag_articles_path(options[:tag])
    else
      [options[:category, :top], :articles]
    end
  end
end
