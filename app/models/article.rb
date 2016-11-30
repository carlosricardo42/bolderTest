class Article < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { maximum: 3000, minimum: 50 }, presence: true
  default_scope -> { order(created_at: :desc) }
end
