class PostsController < ApplicationController
  before_filter :signed_in_user

  def new
    @post = current_user.posts.build if signed_in?
  end

  def show
     @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to root_path
      flash[:success] = "Post created!"
    else
      redirect_to '/newpost'
    end
  end

  def destroy
  end
end