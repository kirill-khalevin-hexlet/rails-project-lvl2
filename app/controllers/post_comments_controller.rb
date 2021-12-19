class PostCommentsController < ApplicationController
  def create
    post_ids = params.permit(:post_id)
    ancestry = params.permit(:ancestry)
    post_comment_params = params.require(:post_comment).permit(:content)
    obj = if ancestry[:ancestry].present?
            PostComment.find(ancestry[:ancestry]).children
          else
            PostComment
          end
    obj.create(post_comment_params.merge(post_ids).merge({ creator: current_user.id })).persisted?
  end
end
