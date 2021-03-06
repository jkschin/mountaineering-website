include PostsHelper
class PostsController < ApplicationController
  before_action :is_admin?, only: [:new, :edit, :update, :destroy]
  respond_to :html

  def index
    @posts = Post.order("created_at DESC")
    @posts = @posts.tagged_with(params[:tag]) if params[:tag]
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
