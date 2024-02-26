class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :spot_name, :content, :spot_image, :flow_video))
    if @post.save
      flash[:notice] = "新規投稿の作成に成功しました"
      redirect_to :posts
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :spot_name, :content, :spot_image, :flow_video))
      flash[:notice] = "「#{@post.name}」の情報を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
  end
end
