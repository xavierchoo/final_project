class LikesController < ApplicationController

	def create		
	 	selected = Article.find(params[:article_id])
	 	like = Like.new(article_id: selected.id, user_id: current_user.id)
	 	if like.save
			redirect_to admin_index_path
		else
			redirect_to "/"
		end
	end

end
