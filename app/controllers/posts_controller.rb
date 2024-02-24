class PostsController < ApplicationController
  def index
    @posts = Posts.where(user_id: @current_user)
  end
end
