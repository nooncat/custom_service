module CompaniesStat
  def self.with_overdue_debt(top: 10, force: false)
    @with_overdue_debt if @with_overdue_debt && !force

    @with_overdue_debt = companies_with_overdue_debt.map do |e|
      OpenStruct.new({name: e.name, overdue_debt: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:overdue_debt).last(top).reverse
  end

  def self.with_debt(top: 10, force: false)
    @with_debt if @with_debt && !force

    @with_debt = companies_with_debt.map do |e|
      OpenStruct.new({name: e.name, debt: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:debt).last(top).reverse
  end

  def self.with_total_income(top: 10, force: false)
    @with_total_income if @with_total_income && !force

    @with_total_income = companies.map do |e|
      OpenStruct.new({name: e.name, income: e.sellings.sum(&:total).round(2)})
    end.sort_by(&:income).last(top).reverse
  end

  def self.svh_income_by_weeks(from: (Date.today - 9.week).beginning_of_week,force: false)
    @svh_week_income if @svh_week_income && !force

    sellings =  Selling.includes(:selling_items).where('payed_at > ?', from).
      group_by{ |e| e.payed_at.beginning_of_week.to_date }
    weeks = (from..Date.today).select{|e| e == e.beginning_of_week}

    # byebug
    @svh_week_income = weeks.map{ |w| OpenStruct.new({date: w, income: sellings[w] ? sellings[w].sum(&:total).round(2) : 0 }) }
  end

  def self.companies
    Company.includes(sellings: :selling_items)
  end

  def self.companies_with_debt
    companies.where(sellings: {payed_at: nil})
  end

  def self.companies_with_overdue_debt
    companies_with_debt.where('planned_payment_date < ?', Time.zone.now)
  end
end
