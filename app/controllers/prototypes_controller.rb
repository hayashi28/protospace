class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order(created_at: :DESC)
  end

  def show
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path, notice: 'Saved successfully'
    else
      render :new, alert: 'Failed to Save'
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catchcopy, :concept, :user_id, prototype_images_attributes: [:id, :image, :role, :prototype_id])
  end

end

