class WelcomeController < ApplicationController

	def index
		@testings = Testing.all
		@articles = AdminSelection.all
		@new_select = AdminSelection.new
	end

	def show 

	end

end
