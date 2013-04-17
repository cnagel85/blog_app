class PostsController < ApplicationController
  before_filter :signed_in_user, except: :show
  before_filter :correct_user,   only: :destroy

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
    @post.destroy
    redirect_to current_user
  end

  private

  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to current_user if @post.nil?
  end

end