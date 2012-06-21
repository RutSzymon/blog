class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])#.articles.try(:page, params[:page])
    #@articles = Article.page params[:page]
    @articles = @category.articles.page params[:page]
  end
end