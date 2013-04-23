class PostsController < ApplicationController
  before_filter :signed_in_user, except: :show
  before_filter :correct_user,   only: :destroy

  def new
    @post = current_user.posts.build if signed_in?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to @post
    else
     render 'edit'
    end
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
    @post = Post.find( params[:id] )
    @post.destroy
    redirect_to root_path
  end

  private

  def correct_user
    @post = current_user.posts.find(params[:id])
    redirect_to current_user if @post.nil?
  end

end