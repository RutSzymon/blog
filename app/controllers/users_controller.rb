class UsersController < ApplicationController

  respond_to :html, :xml, :json

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.avatar = params[:user].delete(:avatar)
    @user.update_attributes(params[:user])
    respond_with @user
  end
end