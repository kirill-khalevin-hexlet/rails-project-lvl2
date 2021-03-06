class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :post_category, foreign_key: true
      t.string :title
      t.string :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
