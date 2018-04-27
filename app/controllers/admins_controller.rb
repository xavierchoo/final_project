class AdminsController < ApplicationController
	before_action :check_user
	before_action :check_admin

	def index

		@articles = Article.all
	end

	
	def create
		
	 	selected = Article.find(params[:article_id])
	 	new_select = WelcomeIndex.new(article_id: selected.id, user_id: current_user.id)
		if new_select.save
			redirect_to admin_index_path
		else
			redirect_to root_path
		end
	end


	# def check_admin
	# 	if !current_user.admin
	# 		redirect_to root_path
	# 	end
	# end
