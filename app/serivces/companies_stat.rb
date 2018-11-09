module CompaniesStat
  def self.with_overdue_debt(top: 10)
    companies_with_overdue_debt.map do |e|
      OpenStruct.new({name: e.name, overdue_debt: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:overdue_debt).last(top).reverse
  end

  def self.with_debt(top: 10)
    companies_with_debt.map do |e|
      OpenStruct.new({name: e.name, debt: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:debt).last(top).reverse
  end

  def self.with_total_income(top: 10)
    companies.map do |e|
      OpenStruct.new({name: e.name, income: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:income).last(top).reverse
  end

  def self.companies
    Company.includes(sellings: :selling_items)
  end

  def self.companies_with_debt
    companies.where(sellings: {payed: false})
  end

  def self.companies_with_overdue_debt
    companies_with_debt.where('planned_payment_date < ?', Time.zone.now)
  end
end
