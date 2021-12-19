class AddAncestryToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :ancestry, :string
    add_index :post_comments, :ancestry
  end
end
