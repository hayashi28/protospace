class PrototypeImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :prototype
  enum role: %i(main sub)
end

