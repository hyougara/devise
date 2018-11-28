class FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @favotite = Favorite.create(user_id: current_user.id, post_id: params[:post_id])
    @posts = Post.all
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    @posts = Post.all
  end

    private
      def set_post
        @pots = Post.find(params[:post_id])
end
