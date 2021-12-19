class PostComment < ApplicationRecord
  has_ancestry
  belongs_to :post
  belongs_to :user, foreign_key: 'creator'
end
