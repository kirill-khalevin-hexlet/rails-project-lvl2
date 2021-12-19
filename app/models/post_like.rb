class PostLike < ApplicationRecord
  belongs_to :user, foreign_key: 'creator'
  belongs_to :post
end
