class User < ApplicationRecord
  include Clearance::User
  has_many :admin_selections

  mount_uploader :profile_pic, ProfilePicUploader
  validates :email, presence: true

end