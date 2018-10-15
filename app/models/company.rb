class Company < ApplicationRecord

  has_many :company_contacts

  def to_s
    name
  end
end
