class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @posts = @q.result
    @posts = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit 
      end
  end

  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :status, :priority, :user_id, :deadline, :limit,
                                    :title_cont, :content_cont, :status_in, :priority_in, :limit_in, :label)
    end
end
