class CommentsController < ApplicationController
  before_action :set_product, only: :create

  def create
    @prototype.comments.create(comment_params)
    @comments = @prototype.comments
  end

  private

  def set_product
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end

end
