class User < ApplicationRecord
  include Clearance::User
  has_many :likes
  has_many :follows
  belongs_to :follow

  mount_uploader :profile_pic, ProfilePicUploader
  validates :email, presence: true

  def get_followers
  	Follow.where(follower_id: self.id)
  end

  def get_following
  	Follow.where(user_id: self.id)
  end

end