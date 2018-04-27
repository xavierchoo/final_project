class AdminSelectionsController < ApplicationController
	
	def create
	
		selected = Testing.find(params[:testing_id])

		new_select = AdminSelection.new(testing_id: selected.id, user_id: current_user.id)
			if new_select.save
				redirect_to admins_path
			else
				redirect_to root_path
			end
		end
	
end
