class PrototypesController < ApplicationController
  before_action :define_prototype, except: [:index, :new, :create]

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

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
      redirect_to root_path, notice: 'Deleted successfully'
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catchcopy, :concept, :user_id, prototype_images_attributes: [:id, :image, :role, :prototype_id])
  end

  def define_prototype
    @prototype = Prototype.find(params[:id])
  end

end


