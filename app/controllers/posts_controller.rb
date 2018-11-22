class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @post = Post.all
    @posts = current_user.posts
    # @q = Post.ransack(params[:q])
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result
    @posts = @q.result.page(params[:page]).per(5)
    
  end

  def show
    
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    # @post = current_user.posts.build(
    # title: params[:title]
    # content: params[:content]
    # status: params[:status]
    # priority: params[:priority]

    # )
    @post.tag_list.add(params[:tag_list],parse: true)
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
      # @post = Post.find(params[:id])
      @post = current_user.posts.find_by(id: params[:id])

    end

    def post_params
      params.require(:post).permit(:title, :content, :status, :priority, :user_id, :deadline, :limit,
                                    :title_cont, :content_cont, :status_in, :priority_in, :limit_in, :tag_list)
    end

    
end
