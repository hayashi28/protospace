class Prototype < ActiveRecord::Base
  validates :title, :catchcopy, :concept, presence: true
  belongs_to :user
  has_one :main_image, -> { where(role: PrototypeImage.roles[:main]) }, class_name: "PrototypeImage"
  has_many :prototype_images, dependent: :delete_all
  has_many :likes, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :prototype_images, reject_if: :reject_sub_images

  acts_as_taggable
  paginates_per 5

  def like_user(user)
   likes.find_by(user_id: user.id)
  end

  def reject_sub_images(attributed)
    attributed['image'].blank?
  end
end
