class LikesController < ApplicationController
	before_action :authenticate_user!

	def toggle
		# byebug
		@post=Post.find(params[:post_id])
		if @post.user_can_like(current_user.id)
			@like=Like.new(user_id:current_user.id,post_id:params[:post_id])
			@like.save(validate:false)
		else
			Like.find_by(user_id:current_user.id,post_id:params[:post_id]).destroy
		end
		redirect_to root_path
	end

	def toggleC
		@comment=Comment.find(params[:comment_id])
		if @comment.user_can_like(current_user.id)
			@like=Like.new(user_id:current_user.id,comment_id:params[:comment_id])
			@like.save(validate:false)
		else
			Like.find_by(user_id:current_user.id,comment_id:params[:comment_id]).destroy
		end
		redirect_to root_path
	end

end
