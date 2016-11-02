class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :first_name, :last_name
  validates :username, uniqueness: true, presence: true
end
