class PostsController < ApplicationController
  include PostsHelper

  def index
    posts_on_page = 10
    @pages = pages(posts_on_page)
    @offset = offset(params[:page].to_i || 1, posts_on_page)
    @posts = Post.offset(@offset).limit(posts_on_page).order(created_at: :desc)
  end

  def show; end

  def new
    redirect_root unless user_signed_in?
    @post = Post.new
  end

  def create
    @p = post_params
    redirect_root if Post.create(post_params).persisted?
  end

  def destroy; end

  private

  def redirect_root
    redirect_to root_path
  end

  def post_params
    params.require(:post).merge({ user_id: current_user.id }).permit(:title, :body, :post_category_id, :user_id)
  end
end
