class User < ApplicationRecord
  has_secure_password

  extend Enumerize

  enumerize :role, in: [:user, :admin], default: :user

  validates :email, presence: true, uniqueness: true
end
