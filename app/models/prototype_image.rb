class PrototypeImage < ActiveRecord::Base
  mount_uploader :image, PrototypeImageUploader
  belongs_to :prototype
  enum role: %i(main sub)
end
