class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_destroy :can_destroy?
  has_many :posts, dependent: :destroy

  private

  def can_destroy?
    if posts.any?
      errors.add(:base, "Can't be destroyed because User have posts")
      throw :abort
    end
    true
  end
end
