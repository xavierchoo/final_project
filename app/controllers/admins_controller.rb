class AdminsController < ApplicationController
	before_action :check_admin

	def index
		n = News.new("e9a7bf1016d247af9980045693f8f46b")
		@index = n.get_top_headlines(sources: "bbc-news")
	end

	def check_admin
		if !current_user.admin
			redirect_to root_path
		end
	end

end
