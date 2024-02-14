class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirm, :introduction))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザーの新規登録に成功しました"
      redirect_to ('/')
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.permit(:name, :introduction, :password, :password_confim))
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to action: :show
    else
      render "edit"
    end
  end
end
