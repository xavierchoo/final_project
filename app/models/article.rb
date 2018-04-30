class Article < ApplicationRecord
	def self.search(search)
	  where("description ilike ?", "%#{search}%") 
	end
end
