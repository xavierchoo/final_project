class Commenting < ApplicationRecord
	attr_accessible :title, :body, :author

	acts_as_tree order: 'created_at DESC'
end
