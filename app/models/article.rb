class Article < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { maximum: 300, minimum: 50 }
end
