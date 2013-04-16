class StaticPagesController < ApplicationController

  def home
    @latest_post = Post.first
  end

  def projects

  end

  def about

  end

  def contact

  end

end
