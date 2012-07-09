class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @articles = Article.tagged_with(params[:id]).page params[:page]
  end
end