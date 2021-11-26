class PostsController < ApplicationController
  include PostsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  before_action :init_pages, only: [:index]
  helper_method :tag_comments, :user_liked

  def index
    @posts = Post.offset(@offset).limit(@posts_on_page).order(created_at: :desc)
  end

  def show
    begin
      @post = Post.find(params.permit(:id)[:id])
      @post_comments_root = PostComment.where(post_id: @post.id, ancestry: nil)
      @likes = @post.post_likes.count
      @like_of_user = @post.post_likes.find_by(user_id: current_user&.id)
    rescue ActiveRecord::RecordNotFound
      redirect_root
    end
  end

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

  def user_liked
    @like_of_user.present?
  end

  def post_params
    params.require(:post).merge({ user_id: current_user.id }).permit(:title, :body, :post_category_id, :user_id)
  end

  def init_pages
    @posts_on_page = 10
    @pages = pages(@posts_on_page)
    @offset = offset(params.permit(:page)[:page].to_i, @posts_on_page)
  end
end
