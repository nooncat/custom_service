class SellingItem < ApplicationRecord
  belongs_to :selling

  def total_cost
    quantity.to_i * price.to_i
  end

  def nds_total
    total_cost.to_i * nds_percent.to_i / 100
  end

  def total
    total_cost.to_i + nds_total.to_i
  end
end
