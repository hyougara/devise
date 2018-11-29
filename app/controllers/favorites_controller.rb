class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    redirect_to "/posts/#{params[:post_id]}"
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    redirect_to "/posts/#{params[:post_id]}"
  end

  # before_action :set_post, only: [:create, :destroy]

  # def create
  #   @favotite = Favorite.create(user_id: current_user.id, post_id: params[:post_id])
  #   @posts = Post.all
  # end

  # def destroy
  #   favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  #   @posts = Post.all
  # end

  #   private
  #     def set_post
  #       @post = Post.find(params[:post_id])
  #     end
end
