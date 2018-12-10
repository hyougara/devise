class FavoritesController < ApplicationController
  before_action :set_post, only: %i(create)

  def create
    @favorite = current_user.favorites.find_by(post: @post)
    toggle(@favorite.present?)
  end

  private
  
    def set_post
      @post = Post.find(params[:post_id])
    end

    def toggle(present)
      if present
        @favorite.destroy ? render :head, 200 : render :head, 500
      else
        @favorite = current_user.favories.build(post: @post)
        @favorite.save ? render :head, 200 : render :head, 403
      end
    end
end
