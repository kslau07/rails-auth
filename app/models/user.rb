class User < ApplicationRecord
  has_secure_password

  # This was in the tutorial but was not used.
  # attr_accessor :email, :password, :password_confirmation

  # validates_uniqueness_of :email
  validates :email, uniqueness: true
  has_many :articles
end
