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
  end

  def edit
  end

  def update
  end
end
