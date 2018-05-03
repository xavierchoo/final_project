class Article < ApplicationRecord

	has_many :likes
	has_many :bookmarks

	def self.search(search)
	  where("description ilike ?", "%#{search}%")
	end

end
