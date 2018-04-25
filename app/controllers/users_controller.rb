class UsersController < Clearance::UsersController

	def show
	end

	def create

		@user =User.new(register_params)
		if @user.save
		    sign_in @user
		    redirect_to '/'
		else
		    render template: "users/new"
		end
	end

	private

	def register_params
		params.require(:user).permit(:first_name , :last_name , :username ,:email ,:password)
	end

end
