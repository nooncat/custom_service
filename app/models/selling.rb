class Selling < ApplicationRecord
  belongs_to :temporary_storage_warehouse_transaction
  has_many :selling_items
end
