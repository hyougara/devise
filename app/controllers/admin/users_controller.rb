class Admin::UsersController < ApplicationController
  # before_action :admin_params, only: [:index, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def index
    # @user = User.find_by(id: params[:id])
    @users = User.all.order(created_at: :desc)

  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to admin_users_path
  end


    


      private
      # このメソッドでadmin_user以外はadmin/usersのページにはいけない様にする
      # trueならばいindexアクション,falseならばrootに飛ぶ
      # admin_userを他でも使い回すならApplicationControllerに書く
        def admin_user
          redirect_to root_url unless current_user.admin?
        end

end
