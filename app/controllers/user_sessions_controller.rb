class UserSessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to("/users/#{@user.id}/show", notice: 'ログインしました')
    else
      flash[:alert] = 'ログインに失敗しました'
      render 'user_sessions/new'
    end
  end

  def destroy
    logout
    redirect_to('/', notice: 'ログアウトしました')
  end

  def guest_login
    guest_user = User.find_by(guest: true)
    auto_login(guest_user)
    redirect_back_or_to("/users/#{guest_user.id}/show", notice: 'ログインしました')
  end
end
