module CompaniesStat
  def self.with_overdue_debt(top: 10)
    [
      {name: "OAO РЖД", overdue_debt: 1000000},
      {name: "ООО Носков и Ко", overdue_debt: 900000},
      {name: "OAO Птицефабрика", overdue_debt: 880000},
      {name: "ООО Рога и Копыта", overdue_debt: 100000},
      {name: "OAO ГазВазГорСтрой", overdue_debt: 40000},
      {name: "ООО Вагоностроительный завод №1", overdue_debt: 40000},
      {name: "ЗАО Автодор транс", overdue_debt: 10000},
    ].map{ |e| OpenStruct.new e }
  end

  def self.with_debt(top: 10)
    [
      {name: "OAO РЖД", debt: 2000000},
      {name: "ООО Носков и Ко", debt: 1800000},
      {name: "OAO Птицефабрика", debt: 1680000},
      {name: "ООО Рога и Копыта", debt: 200000},
      {name: "OAO ГазВазГорСтрой", debt: 80000},
      {name: "ООО Вагоностроительный завод №1", debt: 40000},
      {name: "ЗАО Автодор транс", debt: 20000},
    ].map{ |e| OpenStruct.new e }
  end
end
