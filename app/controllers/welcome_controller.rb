class WelcomeController < ApplicationController

	def index

		@articles = Article.all
		@new_select = WelcomeIndex.new
	end

end
