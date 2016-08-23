class PrototypeImage < ActiveRecord::Base
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :prototype
  enum role: %i(main sub)
end

