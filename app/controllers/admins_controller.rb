class AdminsController < ApplicationController
	# before_action :check_admin

	def index
		@articles = Testing.all
		@new_select = AdminSelection.new
	
	end

	# def check_admin
	# 	if !current_user.admin
	# 		redirect_to root_path
	# 	end
	# end

end
