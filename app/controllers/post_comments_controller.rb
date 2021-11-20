class PostCommentsController < ApplicationController
  def create
    post_id = params.permit(:post_id)
    post_comment_params = params.require(:post_comment).permit(:content)
    PostComment.create(post_comment_params.merge(post_id).merge({ user_id: current_user.id })).persisted?
  end
end
