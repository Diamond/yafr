class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :feeds

  validates :email, presence: true, uniqueness: true

  def self.authenticate(email, password)
    user = User.where(email: email).first
    return false if user.nil?
    user.authenticate(password)
  end
end
