class ArticlesController < ApplicationController
  def index
    @articles = Article.page params[:page]  
  end

  def show
    @article = Article.find(params[:id])
  end

  def top
    @articles = Article.order(params[:id])
  end
end
