class Selling < ApplicationRecord
  belongs_to :temporary_storage_warehouse_transaction
  has_many :selling_items
  has_many :invoice_notifications

  def total_cost
    selling_items.sum{ |e| e.quantity * e.price }
  end

  def nds_total
    selling_items.sum{ |e| e.total_cost * e.nds_percent / 100 }.round(2)
  end

  def total
    total_cost + nds_total
  end
end
