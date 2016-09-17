class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :nickname, :member, :profile, :works, presence: true
  mount_uploader :avatar, AvatarUploader
  has_many :prototypes
  has_many :likes
end
