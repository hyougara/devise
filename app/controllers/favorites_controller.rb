class FavoritesController < ApplicationController
  before_action :set_post, only: %i(create destroy)
#   def create
#     @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
#     @favorite.save
#     redirect_to "/posts/#{params[:post_id]}"
#   end

#   def destroy
#     @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
#     redirect_to "/posts/#{params[:post_id]}"
#   end
# end

# class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build(post: @post)
    if @favorite.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @favorite = current_user.favorites.find(post: @post)
    @favorite.destroy
    redirect_to post_path(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end

