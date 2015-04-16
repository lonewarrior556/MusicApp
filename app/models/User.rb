class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validate :password_cannot_be_blank
  attr_accessor :password













private

  def password_cannot_be_blank
    if self.password.to_s.length ==0
      errors.add(:password, "cannot be blank")
    end
  end

end
