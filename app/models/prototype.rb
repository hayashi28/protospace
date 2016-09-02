class Prototype < ActiveRecord::Base
  validates :title, :catchcopy, :concept, presence: true
  belongs_to :user
  has_one :main_image, -> { where(role: 0) }, class_name: "PrototypeImage"
  has_many :prototype_images, dependent: :delete_all
  accepts_nested_attributes_for :prototype_images, reject_if: :reject_sub_images, limit: 4

  def reject_sub_images(attributed)
    attributed['image'].blank?
  end
end
