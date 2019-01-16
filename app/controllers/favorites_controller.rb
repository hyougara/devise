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
        @favorite.destroy ? (head :created) : (head :unprocessable_entity)
      else
        @favorite = current_user.favorites.build(post: @post)
        @favorite.save ?  (head :created) : (head :unprocessable_entity)
      end
    end
end
