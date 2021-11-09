class PostCategory < ApplicationRecord
  before_destroy :can_destroy?
  has_many :posts, dependent: :destroy

  private

  def can_destroy?
    if posts.any?
      errors.add(:base, "Can't be destroyed because PostCategory linked to posts")
      throw :abort
    end
    true
  end
end
