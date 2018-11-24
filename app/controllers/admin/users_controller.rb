class Admin::UsersController < Admin::BaseController
  before_action :check_role, only: %i(index)

  def index
    @posts = current_user.posts
    # 処理
  end

  private

    def check_role
      ability = Ability.new(current_user)
      redirect_to dashbord_path if ability.admin?
    end
end
