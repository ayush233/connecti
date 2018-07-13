class CommentsController < ApplicationController
	before_action :authenticate_user!,only: [:create,:destroy]
	def create
		Comment.create(content:params[:comment][:content],user_id:current_user.id,post_id:params[:comment][:post_id])
		redirect_to root_path
	end
	def destroy
	@comment=Comment.find(params[:id])	
  	if @comment.user_id== current_user.id
  		@comment.destroy
  	end	
  	redirect_to root_path
  end
end
