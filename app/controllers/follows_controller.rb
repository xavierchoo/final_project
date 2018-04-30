class FollowsController < ApplicationController
	
	def create
<<<<<<< HEAD
		if Follow.where(user_id: @user.id , follower_id: current_user.id)
			@user = User.find(params[:follower_id])
=======
		@user = User.find(params[:follower_id])
		if Follow.where(follower_id: current_user.id,user_id: @user.id).exists?
		else
>>>>>>> fc94ca86e5e2deb0fd96f4c9ade79780711a1ccd
			follow = Follow.new(follower_id: current_user.id, user_id: @user.id)
			if follow.save
				redirect_to admin_index_path
			else
				redirect_to "/"
			end
		end
	end

end
