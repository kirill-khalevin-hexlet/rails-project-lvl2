class PostLikesController < ApplicationController
  def index
    post.post_likes.create(creator: current_user.id) if like.nil?
    redirect_to_post
  end

  def destroy
    like&.destroy
    redirect_to_post
  end

  private

  def post
    @post ||= Post.find_by(id: params.permit(:post_id)[:post_id])
  end

  def like
    @like ||= post.post_likes.find_by(creator: current_user.id) if post.present?
  end

  def redirect_to_post
    redirect_to post_path(post)
  end
end
