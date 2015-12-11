class User < ActiveRecord::Base
  has_many  :surveys
  has_many  :responses

  include BCrypt

  attr_accessor   :password_confirmation

  validates   :username, presence: true, uniqueness: true
  validates_confirmation_of   :password, confirm: :password_confirmation

  def password_confirmation_matches
    unless password_confirmation == self.password
      errors.add(:password_confirmation, "must match password")
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
