class PostsController < ApplicationController
  def index
    @posts = Posts.where(user_id: @current_user)
  end
  
  def new
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
