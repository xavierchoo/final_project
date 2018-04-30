class AdminsController < ApplicationController
	# before_action :check_user
	# before_action :check_admin

	def index
		
		  if params[:search]
		    @articles = Article.search(params[:search]).order("created_at DESC")
		  elsif(params.has_key?(:category) )
		    @articles = Article.where(category: params[:category], published: false)
		  else 
		  	@articles = Article.where(published: false)
		  end
		
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
