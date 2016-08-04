class UsersController < ApplicationController
  before_action :user, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user
    @user = User.find(params[:id])
  end

end
