class FollowsController < ApplicationController
	
	def create
<<<<<<< HEAD

=======
>>>>>>> 44327605c15ddf17e8f4d5a6f990a557e21cc46e
		@user = User.find(params[:follower_id])
		if Follow.where(follower_id: current_user.id,user_id: @user.id).exists?
		else
			follow = Follow.new(follower_id: current_user.id, user_id: @user.id)
			if follow.save
				redirect_to admin_index_path
			else
				redirect_to "/"
			end
		end
	end

end
