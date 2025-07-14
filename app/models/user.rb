# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  enum status: { pending: 0, active: 1 }

  validates :registration, uniqueness: true
end
