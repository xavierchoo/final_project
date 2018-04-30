class LikesController < ApplicationController

	def create		
	 	selected = Article.find(params[:article_id])
	 	if Like.where(article_id: selected.id, user_id: current_user.id).exists?
	 	else
	 		like = Like.new(article_id: selected.id, user_id: current_user.id)
	 		if like.save
				redirect_to admin_index_path
			else
				redirect_to "/"
			end
		end
	end

end
