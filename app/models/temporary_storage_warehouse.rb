class TemporaryStorageWarehouse < ApplicationRecord
  has_many :users

  def to_s
    [region_num, region_name].reject(&:blank?).join(', ')
  end
end
