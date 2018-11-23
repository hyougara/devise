class UsersController < ApplicationController
  # before_action :set_user, only: [:index, :show]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to root_path
  end


  # private
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

end