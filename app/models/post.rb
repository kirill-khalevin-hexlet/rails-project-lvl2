class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  before_destroy :can_destroy?

  private

  def can_destroy?
    if post_comments.any?
      errors.add(:base, "Can't be destroyed because post_comment linked to post")
      throw :abort
    end
    true
  end
end
