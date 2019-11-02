class CommentsController < ApplicationController
	def create
		@blog_post = BlogPost.find(params[:blog_post_id])
		@comment = @blog_post.comments.create(params[:comment].permit(:name, :comments))
		redirect_to blog_post_path(@blog_post)
	end

	def destroy
		
	end

end
