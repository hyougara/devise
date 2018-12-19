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
        @favorite.destroy ? render head :200 render head ('unprocessable_entity')
      else
        @favorite = current_user.favories.build(favorites_params)
        @favorite.save ? 
        render (head: 'created')  render (head: 'unprocessable_entity')
      end
    end

    def favorites_params
      params.permit(:post_id)
    end

end
