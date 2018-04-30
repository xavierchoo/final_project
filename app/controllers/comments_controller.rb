class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to '/'
		else
			redirect_to '/'
		end
	end

	def index
		@comments = Comment.all
	end

	def show 
		
	end

	private

	def comment_params
		params.require(:comment).permit(:article_id , :user_id , :comment )
	end
	
end
