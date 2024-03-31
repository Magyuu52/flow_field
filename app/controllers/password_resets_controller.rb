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
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  end

  def update
    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      flash[:notice] = "パスワードがリセットされました"
    else
      flash[:alret] = "パスワードの再設定に失敗しました"
      render :edit
    end
  end
end
