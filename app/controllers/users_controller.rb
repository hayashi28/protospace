class UsersController < ApplicationController
  before_action :user, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.order(created_at: :DESC)
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path, notice: "Successfully update user."
    else
      render :edit
    end
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:email ,:nickname, :member, :profile, :works, :avatar)
  end

end
