class LikesController < ApplicationController
	before_action :find_post
	before_action :find_like, only: [:destroy]
	def create
		if already_liked?
			flash[:notice] = "You can't like more than once"
		else
			@blog_post.likes.create(user_id: current_user.id)
		end
		redirect_to blog_post_path(@blog_post)
	end

	def destroy
		if !(already_liked?)
			flash[:notice] = "Cannot unlike"
		else
			@like.destroy
		end
		redirect_to blog_post_path(@blog_post)
	end

		
	private
	def find_post
		@blog_post = BlogPost.find(params[:blog_post_id])
	end
	def already_liked?
		Like.where(user_id: current_user.id, blog_post_id: params[:blog_post_id]).exists?
	end
	def find_like
   		@like = @blog_post.likes.find(params[:id])
end
end
