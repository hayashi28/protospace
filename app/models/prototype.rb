class Prototype < ActiveRecord::Base
  validates :title, :catchcopy, :concept, presence: true
  belongs_to :user
  has_many :prototype_images
  accepts_nested_attributes_for :prototype_images
end
