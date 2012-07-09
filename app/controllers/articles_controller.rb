class ArticlesController < ApplicationController
  def index
    @articles = Article.page params[:page]
  end

  def show
    @category = Category.find(params[:category_id]) if params[:category_id]
    @tag = Tag.find(params[:tag_id]) if params[:tag_id]
    @article = Article.find(params[:id])
    #session[:last_product_page] = request.env['HTTP_REFERER'] || articles_path
  end

  def top
    @articles = Article.top(10)
    #order("comments_count DESC").limit(10)
  end
end
