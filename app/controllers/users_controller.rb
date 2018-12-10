class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to root_path, notice: "ユーザーを削除しました"
  end
  
end