class Company < ApplicationRecord
  include PgSearch
  multisearchable against: :name

  has_many :company_contacts
  has_many :temporary_storage_warehouse_transaction
  has_many :sellings, through: :temporary_storage_warehouse_transaction

  validates :ogrn, format: {with: /\A\d{13}\Z/, message: 'имеет не верный формат, должно содержать 13 символов'}
  validates :inn, format: {with: /\A\d{10}\Z/, message: 'имеет не верный формат, должно содержать 10 символов'}
  validates :kpp, format: {with: /\A\d{9}\Z/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_schet, format: {with: /\A\d{20}\Z/, message: 'имеет не верный формат, должно содержать 20 символов'}
  validates :bank_bik, format: {with: /\A\d{9}\Z/, message: 'имеет не верный формат, должно содержать 9 символов'}
  validates :bank_kor_schet, format: {with: /\A\d{20}\Z/, message: 'имеет не верный формат, должно содержать 20 символов'}

  after_commit :rebuild_search_index, if: -> { previous_changes[:name].present? }

  def to_s
    name.to_s
  end

  private

  def rebuild_search_index
    # TODO: make async
    PgSearch::Multisearch.rebuild(Selling)
  end
end
