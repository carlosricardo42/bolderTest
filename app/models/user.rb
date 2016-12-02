class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :remember_token
  has_many :articles, dependent: :destroy
  validates :first_name, :last_name,   presence: true
  after_initialize :set_default_role, if: :new_record?
  royce_roles %w[writter admin ]
#  scope :my_articles, joins(:articles).where('.user_id = ?', self.id)
  def set_default_role
    if self.admin?
       self.admin!
    else
      self.writter!
    end
  end
end
