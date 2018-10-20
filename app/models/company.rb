class Company < ApplicationRecord

  has_many :company_contacts

  validates :ogrn, format: {with: /\d{13}/, message: 'имеет не верный формат, должно содержать 13 символов'}
  validates :inn, format: {with: /\d{10}/, message: 'имеет не верный формат, должно содержать 10 символов'}
  validates :kpp, format: {with: /\d{9}/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_schet, format: {with: /\d{20}/, message: 'имеет не верный формат, должно содержать 20 символов'}
  validates :bank_bik, format: {with: /\d{9}/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_kor_schet, format: {with: /\d{20}/, message: 'имеет не верный формат, должно содержать 20 символов'}

  def to_s
    name.to_s
  end
end
