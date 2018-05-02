class PreferenceController < ApplicationController
	def update	
		current_user.preference << params[:preference] 
		current_user.save

		redirect_to user_path(id: current_user.id)
	end
end
