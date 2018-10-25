class SellingItem < ApplicationRecord
  belongs_to :selling

  def total_cost
    quantity * price
  end

  def nds_total
    total_cost * nds_percent / 100
  end

  def total
    total_cost + nds_total
  end
end
