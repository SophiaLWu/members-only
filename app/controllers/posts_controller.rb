class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create] 

  def index
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = session[:id] 
    if @post.save
      flash[:success] = "Post successfully created."
      redirect_to posts_path
    else
      flash[:danger] = "Post was not created."
      render "new"
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
