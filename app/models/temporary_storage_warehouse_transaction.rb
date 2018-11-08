class TemporaryStorageWarehouseTransaction < ApplicationRecord
  extend Enumerize

  enumerize :vehicle_type, in: [:truck, :less_15, :less_30], default: :truck
  enumerize :state, in: [:checkin, :inprogress, :chekout], default: :checkin
  enumerize :deal_type, in: [:import, :export], default: :import

  AVAILABLE_COUNTRIES = [:nl, :lu, :sm, :mk, :tr, :ua, :ch, :fo, :gi, :is, :ee, :lt, :rs, :ad, :hu, :be, :pt, :gb, :im, :sk, :hr, :cz, :it, :fi, :va, :ru, :pl, :mt, :de, :sj, :si, :ax, :ro, :bg, :je, :at, :se, :mc, :dk, :fr, :al, :li, :md, :ie, :es, :ba, :gr, :gg, :by, :lv, :no, :me].freeze

  belongs_to :company
  belongs_to :user

  has_one :selling
  has_many :notifications

  alias_attribute :responsible, :user

  def country # NOTICE: may be move to helpers
    country_code.present? ? ISO3166::Country[country_code.to_sym] : nil
  end

  def country_name # NOTICE: may be move to helpers
    country && country.translations[I18n.locale.to_s]
  end

  def to_s
    "#{id}: #{country_code.upcase}: #{vehicle_number}"
  end

  def arrival_notifications
    notifications.with_notification_type(:arrival_notice)
  end

  def departure_notifications
    notifications.with_notification_type(:departure_notice)
  end
end
