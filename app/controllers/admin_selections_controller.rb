class AdminSelectionsController < ApplicationController
	
	def create
	
		selected = Article.find(params[:article_id])

		new_select = WelcomeIndex.new(article_id: selected.id, user_id: current_user.id)
	
			if new_select.save
				redirect_to admins_path
			else
				redirect_to root_path
			end
		end
	
end
