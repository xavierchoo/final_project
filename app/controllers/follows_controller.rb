class FollowsController < ApplicationController
	
	def create

		@user = User.find(params[:follower_id])
		if Follow.where(follower_id: current_user.id,user_id: @user.id).exists?
		else
			follow = Follow.new(follower_id: current_user.id, user_id: @user.id)
			if follow.save
				redirect_to user_path(@user.id)
			else
				redirect_to "/"
			end
		end
	end

end
