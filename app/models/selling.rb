class Selling < ApplicationRecord
  belongs_to :temporary_storage_warehouse_transaction

  extend Enumerize
end