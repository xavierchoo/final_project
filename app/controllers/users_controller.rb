class UsersController < Clearance::UsersController

	def show
		@user = User.find(params[:id])

		@follower = @user.get_followers
		@following = @user.get_following
		@user_comment = Comment.where(user_id: params[:id])
	end

	def create

		@user = User.new(register_params)
		if @user.save
		    sign_in @user
		    redirect_to '/'
		else
		    render template: "users/new"
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user 
		@user.update(edit_params)
		redirect_to admins_path
	end

	private

	def register_params
		params.require(:user).permit(:first_name , :last_name , :username ,:email ,:password)
	end


	private
	def edit_params
		params.require(:user).permit(:profile_pic)
	end
end
