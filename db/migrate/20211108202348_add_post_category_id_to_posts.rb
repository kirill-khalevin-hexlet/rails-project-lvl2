class AddPostCategoryIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_category_id, :integer
  end
end
