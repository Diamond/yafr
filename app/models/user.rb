class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :feeds

  validates :email, presence: true, uniqueness: true

  def self.authenticate(email, password)
    begin
      User.where(email: email).first.authenticate(password)
    rescue RecordNotFoundException
      return false
    end
  end
end
