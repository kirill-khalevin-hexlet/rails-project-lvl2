class Post < ApplicationRecord
  belongs_to :postcategory
  belongs_to :user
end
