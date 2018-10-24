module SellingItemsHelper
  def tsw_services
    [
      {description: "Въезд транспортного средства (далее - ТС), перевозящего находящиеся под таможенным контролем грузы, и его нахождение на прилегающей к складу территории в течение времени, необходимого для завершения таможенной процедуры таможенного транзита.", measure: 'одно ТС', price: 0},
      {description: "Терминальный сбор при импорте после завершения таможенной процедуры таможенного транзита и тр. средство покинуло территорию терминала в течение 4-х часов, в случае привлечения к таможенному оформлению ООО РТП.", measure: 'одно ТС', price: 0},
      {description: "Терминальный сбор при импорте после завершения таможенной процедуры таможенного транзита и тр. средство покинуло территорию терминала в течение 4-х часов.", measure: 'одно ТС', price: 5450},
      {description: "Терминальный сбор при импорте за нахождение тр. средства на прилегающей к складу территории первые, вторые и третьи последующие сутки после завершения таможенной процедуры таможенного транзита, в случае привлечения к таможенному оформлению ООО РТП.", measure: 'одно ТС/сут.', price: 0},
      {description: "Терминальный сбор при импорте за нахождение тр. средства на прилегающей к складу территории первые и каждые последующие сутки после завершения таможенной процедуры таможенного транзита", measure: 'одно ТС/сут.', price: 5450},
      {description: "Терминальный сбор при экспорте", measure: 'одно ТС/сут.', price: 2100},
      {description: "Хранение груза на открытой площадке СВХ в легковом ТС без выгрузки", measure: 'одно ТС/сут.', price: 1820},
      {description: "Хранение груза на открытой площадке СВХ в грузовом ТС без выгрузки", measure: 'одно ТС/сут.', price: 3900},
      {description: "Хранение груза на открытой площадке СВХ в полуприцепе/прицепе без седельного тягача без выгрузки", measure: 'ед./сут.', price: 3500},
      {description: "Хранение негабаритного груза, контейнер 20/40 футовый и пр.", measure: 'тонна/сутки', price: 210},
      {description: "Хранение грузов в крытом помещении СВХ", measure: 'тонна/сутки', price: 220},
      {description: "Вскрытие/восстановление упаковки, вес места до 100 кг (по заявке заказчика)", measure: 'тонна/сутки', price: 60},
      {description: "Вскрытие/восстановление упаковки, вес места свыше 100 кг (по заявке заказчика)", measure: 'грузовое место', price: 110 },
      {description: "Взвешивание паллетированного груза", measure: 'паллета', price: 140},
      {description: "Взвешивание непаллетированного груза до 100 кг", measure: 'операция', price: 63},
      {description: "Взвешивание непаллетированного груза свыше 100 кг", measure: 'операция', price: 125},
      {description: "Подготовка груза к досмотру (выборка по артикулам/наименованиям, перемещение к месту досмотра и обратно)", measure: 'грузовое место', price: 55},
      {description: "Крепление груза", measure: 'одно ТС', price: 700},
      {description: "Опломбирование грузового отсека транспортного ср-ва", measure: 'пломба', price: 140},
      {description: "Механизированная выгрузка или погрузка", measure: 'тонна', price: 600},
      {description: "Комбинированная  выгрузка или погрузка", measure: 'тонна', price: 750},
      {description: "Ручная выгрузка или погрузка", measure: 'тонна', price: 750},
      {description: "Выгрузка или погрузка негабарита с использованием спецтехники (автокран)", measure: 'час', price: 2400},
      {description: "Предоставление места (по заявке заказчика) для осуществления погрузочно-разгрузочных работ силами Заказчика", measure: 'час', price: 420},
      {description: "Фотографирование и печать в ч/б формате", measure: 'лист', price: 120},
      {description: "Прием/отправка факса", measure: 'лист', price: 70},
      {description: "Копирование документов", measure: 'лист', price: 10},
      {description: "Консультационные услуги", measure: 'чел/час', price: 500},
      {description: "Составление писем, заявлений, гарантийных обязательств, акта   взвешивания", measure: 'документ', price: 450},
      {description: "Заполнение товаросопроводительных документов (СМР, книжки МДП)", measure: 'документ', price: 1200},
    ]
  end

  def tsw_services_select_collection
    [['', 0]] + tsw_services.each_with_index.map {|e, i| [e[:description], i + 1]}
  end
end