class Company < ApplicationRecord

  has_many :company_contacts

  validates :ogrn, length: {maximum: 13}
  validates :inn, length: {maximum: 10}
  validates :kpp, length: {maximum: 9}
  validates :bank_schet, length: {maximum: 20}
  validates :bank_bik, length: {maximum: 9}
  validates :bank_kor_schet, length: {maximum: 20}

  def to_s
    name.to_s
  end
end
