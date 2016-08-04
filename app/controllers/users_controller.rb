class UsersController < ApplicationController
  before_action :user, only: [:show, :edit]

  def show
  end

  def edit
  end

  private
  def user
    @user = User.find(params[:id])
  end

end
