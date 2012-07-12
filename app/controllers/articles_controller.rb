class ArticlesController < ApplicationController
  def index
    @category = Category.find(params[:category_id]) if params[:category_id]
    @tag = params[:tag_id]
    @articles = Article.with_category(params[:category_id]).with_tag(params[:tag_id]).page(params[:page])
  end

  def create
    @article = Article.new(params[:id])
  end

  def show
    @category = Category.find(params[:category_id]) if params[:category_id]
    @tag = params[:tag_id]
    @article = Article.find(params[:id])
    #session[:last_product_page] = request.env['HTTP_REFERER'] || articles_path
  end

  def top
    @articles = Article.top(10)
    #order("comments_count DESC").limit(10)
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
end
