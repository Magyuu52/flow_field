class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordResetMailer.with(user: @user).reset.deliver_later
      flash[:notice] = "パスワードリセットメールを送りました"
      redirect_to root_path
    else
      flash[:alret] = "メールアドレスを見つかりませんでした"
      render :new
    end
  end

  def edit
  end

  def update
  end
end
