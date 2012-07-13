class ArticlesController < ApplicationController

  respond_to :html, :xml, :json

  before_filter :categories, only: [:new, :create]
  before_filter :category, only: [:create]
  before_filter :article, only: [:new, :create]


  def index
    @category = Category.find(params[:category_id]) if params[:category_id]
    @tag = params[:tag_id]
    @articles = Article.with_category(params[:category_id]).with_tag(params[:tag_id]).page(params[:page])
  end

  def new
  end

  def create
    @article.user = current_user
    @article.category = category
    @article.save
    respond_with @article
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

  private
  def article
    @article ||= Article.new(params[:article])
  end

  def category
    @category ||= Category.find(params[:article].delete(:category_id)) if params[:article] && params[:article].has_key?(:category_id)
  end

  def categories
    @categories ||= Category.all.map{|c| [c.title, c.id] }
  end

end
