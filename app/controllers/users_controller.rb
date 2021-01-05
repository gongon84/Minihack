class UsersController < ApplicationController
  
  before_action :require_login, only: [:edit, :update, :destroy]

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_profile_params)
      redirect_to("/users/#{@user.id}/show", notice: '編集しました')
    else
      render 'users/edit'
    end
  end
  
  def new
    # これがないとエラーメッセージが出せない
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to("/", notice: '登録に成功しました')
    else
      flash.now[:alert] = '登録に失敗しました'
      render 'users/new'
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      redirect_to("/", notice: 'アカウントを削除しました')
    else
      flash.now[:alert] = '登録に失敗しました'
      render '/'
    end
  end

  
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def user_profile_params
    params.permit(:email, :name, :old, :profile)
  end
end
