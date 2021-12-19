class PostsRenameUserIdToCreator < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :user_id, :creator
    rename_column :post_comments, :user_id, :creator
    rename_column :post_likes, :user_id, :creator
  end
end
