class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: @current_user)
  end
  
  def new
    @post = Post.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
