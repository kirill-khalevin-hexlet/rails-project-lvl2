class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.string :content
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
