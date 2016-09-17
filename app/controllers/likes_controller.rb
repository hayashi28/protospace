class LikesController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:id])
    @like.destroy
    @prototype = Prototype.find(params[:id])
  end
end

