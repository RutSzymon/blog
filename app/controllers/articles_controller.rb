class ArticlesController < ApplicationController
  def index
    @articles = Article.page params[:page]  
  end

  def show
    @article = Article.find(params[:id])
  end

  def top
    @articles = Article.top(10)
    #order("comments_count DESC").limit(10)
  end
end
