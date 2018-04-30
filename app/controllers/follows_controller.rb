class FollowsController < ApplicationController
	
	def create
		@user = User.find(params[:follower_id])
		follow = Follow.new(follower_id: @user.id, user_id: current_user.id)
		if follow.save
			redirect_to admin_index_path
		else
			redirect_to "/"
		end
	end

end
