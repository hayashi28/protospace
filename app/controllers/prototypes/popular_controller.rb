class Prototypes::PopularController < PrototypesController

  def index
    @prototypes = Prototype.includes(:user).order(likes_count: :DESC)
  end

end
