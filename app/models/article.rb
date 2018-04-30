class Article < ApplicationRecord

	has_many :likes

	def self.search(search)
	  where("description ilike ?", "%#{search}%") 
	end

end
