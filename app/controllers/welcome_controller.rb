class WelcomeController < ApplicationController

	def index
		@articles = AdminSelection.all
		@new_select = AdminSelection.new
	end

	def show 

	end

end
