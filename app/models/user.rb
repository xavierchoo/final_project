class User < ApplicationRecord
  include Clearance::User
  has_many :likes
  has_many :follows
  belongs_to :follow, optional: true
  has_many :authentications, dependent: :destroy
  has_many :bookmarks
  has_many :comments

  mount_uploader :profile_pic, ProfilePicUploader
  validates :email, presence: true

  def get_followers
    Follow.where(user_id: self.id)
  end

  def get_following
    Follow.where(follower_id: self.id)
  end

   def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(

     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
  def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
  end
end
