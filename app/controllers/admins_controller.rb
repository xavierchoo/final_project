class AdminsController < ApplicationController
	# before_action :check_user
	# before_action :check_admin

	def index
		@user = current_user
		@articles = Testing.all
		@new_select = AdminSelection.new
	end

	
	def check_admin
		if !current_user.admin
			redirect_to root_path
		end
	end

	def check_user
		if !current_user
			flash[:notice] = "Sorry, please sign in to continue!"
			redirect_to sign_in_path
		end 
	end
	
end
