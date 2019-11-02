class BlogPostsController < ApplicationController
  before_action :authenticate_user!
	def index
    @blog_posts = BlogPost.all
  end
  
  def new
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to root_path
    end
   	@blog_post = BlogPost.new
  end
  
  def create
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to root_path
    end

   	@blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
     	flash[:notice] = "Article was successfully created"
      redirect_to action: "index"
    else
      flash[:danger] = @blog_post.errors.values.join(', ')
      render "new"
    end
  end

  def show
  	@blog_post = BlogPost.find(params[:id])
		render "show"
  end

  def update
        @blog_post = BlogPost.find(params[:id])

        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render 'edit'
        end
    end

    def edit
        @blog_post = BlogPost.find(params[:id])
    end

    def destroy
        @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy

        redirect_to blog_posts_path

    end
  private

  def blog_post_params
    params[:blog_post].permit(:title,:content,:id)
  end
end
