class User < ApplicationRecord
  include Clearance::User
  has_many :likes
  has_many :follows
  belongs_to :follow, optional: true

  mount_uploader :profile_pic, ProfilePicUploader
  validates :email, presence: true

  def get_followers
  	Follow.where(user_id: self.id)
  end

  def get_following
    Follow.where(follower_id: self.id)
  end

end