class TemporaryStorageWarehouse < ApplicationRecord
  def to_s
    [region_num, region_name, address].reject(&:blank?).join(', ')
  end
end
