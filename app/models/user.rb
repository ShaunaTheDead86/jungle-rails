class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, case_sensitive: false, presence: true
  validates :password, :password_confirmation, presence: true
end
