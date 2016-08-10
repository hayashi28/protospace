class UsersController < ApplicationController
  before_action :user, only: [:show, :edit]
  # redirect_to action: :edit, notice: 'ユーザー情報を編集しました'
  validates :email, :nickname, :member, :profile, :works, presence: true

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:id])

    if user.id == current_user.id
      user.update(update_params)
    end

    if user.update(update_params)
      redirect_to root_url, success: "Successfully update user."
    else
      redirect_to root_url, warning: "Unfortunately failed to update."
    end
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:email ,:nickname, :member, :profile, :works)
  end

end
