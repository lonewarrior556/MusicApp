class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validate :password_cannot_be_blank
  attr_accessor :password

  def self.new_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def update_session_token!(token)
    self.update!(session_token: token)
  end

  










private

  def password_cannot_be_blank
    if !self.password.nil? && self.password.length ==0
      errors.add(:password, "cannot be blank")
    end
  end

end
