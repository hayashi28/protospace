module ApplicationHelper
  def post_main_image_helper
    @prototype.main_image.present? ? @prototype.main_image : ""
  end
end
