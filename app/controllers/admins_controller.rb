class AdminsController < ApplicationController
	# before_action :check_admin

	def index
		@articles = Article.all
	end

	
	def create
		
	 	selected = Article.find(params[:article_id])
	 	if selected.update(published: true)
			redirect_to admin_index_path
		else
			redirect_to root_path
		end
	end

end
	# def check_admin
	# 	if !current_user.admin
	# 		redirect_to root_path
	# 	end
	# end
