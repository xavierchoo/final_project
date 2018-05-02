class CommentsController < ApplicationController
	def index
   	 @comments = Commenting.all
  	end

	 def new
	   @comment = Commenting.new(parent_id: params[:parent_id])
	 end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Commenting.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Commenting.new(comment_params)
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to root_url
    else
      render 'new'
    end
  end
	
end
