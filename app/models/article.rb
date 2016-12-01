class Article < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { maximum: 3000, minimum: 50 }, presence: true
  validates :title, presence: true
  default_scope -> { order(created_at: :desc) }

  def can_edit(user)
    user.admin? || user == self.user
  end
end
