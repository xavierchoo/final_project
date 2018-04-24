class AdminsController < ApplicationController
	before_action :check_admin

	def index
	end

	def check_admin
		if !current_user.admin
			redirect_to root_path
		end
	end

end
