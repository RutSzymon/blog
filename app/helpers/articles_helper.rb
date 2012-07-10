module ArticlesHelper
  include ActsAsTaggableOn::TagsHelper
  def previous_path(options = {})
    if !options[:category] && !options[:tag] && !options[:top]
      root_path
    elsif options[:tag]
      tag_articles_path(options[:tag])
    else
      [options[:category], :articles]
    end
  end

  def scoped_article_path(options = {})
    if options[:tag]
      tag_article_path(options[:tag], options[:article])
    elsif options[:category]
      category_article_path(options[:category], options[:article])
    else
      article_path(options[:article])
    end
  end
end
