class PostCommentsController < ApplicationController
  def create
    post_ids = params.permit(:post_id)
    ancestry = params.permit(:ancestry)
    post_comment_params = params.require(:post_comment).permit(:content)
    if ancestry[:ancestry].present?
      obj = PostComment.find(ancestry[:ancestry]).children
    else
      obj = PostComment
    end
    obj.create(post_comment_params.merge(post_ids).merge({ user_id: current_user.id })).persisted?
  end
end
