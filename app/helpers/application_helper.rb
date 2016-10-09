module ApplicationHelper
  def post_main_image_helper
    @prototype.main_image.image.present? ? @prototype.main_image : ''
  end
end
