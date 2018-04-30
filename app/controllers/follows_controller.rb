class FollowsController < ApplicationController
	
	def create
		if Follow.where(user_id: @user.id , follower_id: current_user.id)
			@user = User.find(params[:follower_id])
			follow = Follow.new(follower_id: current_user.id, user_id: @user.id)
			if follow.save
				redirect_to admin_index_path
			else
				redirect_to "/"
			end
		end
	end

end
