class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :temporary_storage_warehouse_transaction

  after_save :update_temporary_storage_warehouse_transaction

  alias_attribute :author, :user

  extend Enumerize

  enumerize :notification_type, in: [:arrival_notice, :departure_notice], default: :arrival_notice, scope: true

  def update_temporary_storage_warehouse_transaction
    if notification_type.arrival_notice?
      temporary_storage_warehouse_transaction.update(checkin_notified: true)
    elsif notification_type.departure_notice?
      temporary_storage_warehouse_transaction.update(checkout_notified: true)
    end
  end
end
