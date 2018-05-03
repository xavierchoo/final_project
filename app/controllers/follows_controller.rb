class FollowsController < ApplicationController
<<<<<<< HEAD
	
	def create

=======

	def create
>>>>>>> 9c39795fef61919eb192344a7aab4134491000ba
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
