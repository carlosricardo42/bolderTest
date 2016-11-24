class User < ActiveRecord::Base
  before_save { email.downcase! }
  has_many :articles
  attr_accessor :first_name, :last_name, :email, :role
  validates :first_name, :last_name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 244 }, format: {with: VALID_EMAIL_REGEX},
  uniqueness: { case_sensitive: false }
  validates :full_name, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def full_name=(value)
    self.first_name, self.last_name = value.to_s.split(" ", 2)
  end
end
