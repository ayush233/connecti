class PostsController < ApplicationController
	
	before_action :set_post,only: [:destroy]
	before_action :authenticate_user!,only: [:create,:destroy]
	before_action :authorization,only: [:destroy]

  def home
  	@post=Post.new
  	@posts=Post.all
  	@comment=Comment.new
  end

  def create
  	post=Post.create(content:params[:post][:content],user_id:current_user.id)
  	redirect_to action: 'home'
  end

  def destroy
  	if @post.user_id== current_user.id
  		@post.destroy
  	end	
  	redirect_to action: 'home'
  end

  private

  	def set_post
  		@post=Post.find(params[:id])
  	end

  	def authorization
  		if @post.user_id != current_user.id
  			redirect_to action: 'home'
  		end
  	end
end
