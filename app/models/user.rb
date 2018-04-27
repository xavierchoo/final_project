class User < ApplicationRecord
  include Clearance::User
  has_many :admin_selections

  validates :email, presence: true
end
