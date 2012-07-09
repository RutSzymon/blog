module ArticlesHelper
  def previous_path(options = {})
    if !options[:category] && !options[:tag]
      root_path
    else
      [options[:category], options[:tag], :articles]
    end
  end
end
