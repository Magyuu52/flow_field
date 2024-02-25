class PostsController < ApplicationController
  def index
    @posts = Post.where(id: @current_user)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :spot_name, :content, :spot_image, :flow_video))
    if @post.save
      flash[:notice] = "新規投稿の作成に成功しました"
      redirect_to :posts_index
    else
      render "new"
    end
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
