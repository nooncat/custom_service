class Company < ApplicationRecord

  has_many :company_contacts

  validates :ogrn, format: {with: /\A\d{13}\Z/, message: 'имеет не верный формат, должно содержать 13 символов'}
  validates :inn, format: {with: /\A\d{10}\Z/, message: 'имеет не верный формат, должно содержать 10 символов'}
  validates :kpp, format: {with: /\A\d{9}\Z/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_schet, format: {with: /\A\d{20}\Z/, message: 'имеет не верный формат, должно содержать 20 символов'}
  validates :bank_bik, format: {with: /\A\d{9}\Z/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_kor_schet, format: {with: /\A\d{20}\Z/, message: 'имеет не верный формат, должно содержать 20 символов'}

  def to_s
    name.to_s
  end
end
