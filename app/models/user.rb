class User < ApplicationRecord
  has_secure_password

  extend Enumerize

  enumerize :role, in: [:user, :admin], default: :user

  validates :email, presence: true, uniqueness: true

  belongs_to :temporary_storage_warehouse, optional: true

  def to_s
    email
  end

  def full_name
    [lastname, name, middlename].compact.join(' ')
  end
end
