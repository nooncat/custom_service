TemporaryStorageWarehouse.delete_all

storages = [
  {
    name: 'Общество с ограниченной ответственностью «Вавс»',
    director: 'Нестеров Николай Николаевич',
    region_num: 73,
    region_name: 'Ульяновская обл.',
    ogrn: '1177325000467',
    inn: '7328092118',
    kpp: '732801001',
    uridicheskiy_address: 'Российская Федерация, 432072, Ульяновская область, г. Ульяновск, Заволжский район, 1-й пр. Инженерный, 17',
    real_address: 'Российская Федерация, 432072, Ульяновская область, г. Ульяновск, Заволжский район, 1-й пр. Инженерный, 17',
    bank_schet: '40702810402500003010',
    bank_name: 'ТОЧКА ПАО БАНКА «ФК ОТКРЫТИЕ»',
    bank_bik: '044525999',
    bank_city: 'Москва',
    bank_kor_schet: '30101810845250000999',
    phone:  "+7 8422 75-11-55",
    email: "tlt@vavs-org.ru"
  }
].map do |e|
  TemporaryStorageWarehouse.create!(e)
end


User.delete_all

ul_storage = TemporaryStorageWarehouse.find_by(region_num: 73)
users = [
  {
    email: 'Gorlov.Sergey@vavs-org.ru',
    name: 'Сергей',
    middlename: 'Александрович',
    lastname: 'Горлов',
    role: :user,
    password: '123',
    password_confirmation: '123',
    temporary_storage_warehouse_id: ul_storage.id
  },
  {
    email: 'Masyaev.Yury@vavs-org.ru',
    name: 'Юрий',
    middlename: 'Владимирович',
    lastname: 'Масяев',
    role: :user, password: '123',
    password_confirmation: '123',
    temporary_storage_warehouse_id: ul_storage.id
  }
].each do |e|
  User.create!(e)
end

Company.delete_all

company_names = ['OOO Гранд', 'ОАО Бридж стоун', 'ИП Белов', 'ООО Самара строй', 'ОАО РЖД', 'ОАО Инвест строй', 'ОАО УАЗ', 'ОАО ТАЗ', 'ОАО Камаз', 'ООО Автозапчасть', 'ИП Петров']
(1..10).map { |i|
  {
    name: company_names[i],
    ogrn: 13.times.map{ |e| rand(0..9) }.join(''),
    inn: 10.times.map{ |e| rand(0..9) }.join(''),
    kpp: 9.times.map{ |e| rand(0..9) }.join(''),
    uridicheskiy_address: 'г.Москва. ул. Пушкина, д.101, оф 101',
    real_address: 'г.Москва. ул. Пушкина, д.101, оф 101',
    bank_schet: 20.times.map{ |e| rand(0..9) }.join(''),
    bank_name: 'ПАО БИНБАНК',
    bank_bik: 9.times.map{ |e| rand(0..9) }.join(''),
    bank_city: 'Москва',
    bank_kor_schet: 20.times.map{ |e| rand(0..9) }.join(''),
    phone:  "+#{79001001010+i}",
    email: "compnay_#{i}@test.home",
    discount: rand(10..50),
    deferment_of_payment: rand(5..15),
    agreement_num: 6.times.map{ |e| rand(0..9) }.join(''),
    director: 'Антон Антонович'
  }
}.each do |e|
  Company.create!(e)
end

companies = Company.all

TemporaryStorageWarehouseTransaction.delete_all

users = ul_storage.users
letters = %w[A B C E O P T]
(1..100).map { |i|
  {
    company: companies.sample,
    vehicle_number: "#{letters.sample}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{letters.sample}#{letters.sample}.73",
    vehicle_type: TemporaryStorageWarehouseTransaction.vehicle_type.values.sample,
    state: TemporaryStorageWarehouseTransaction.state.values.sample,
    pallet_count: rand(1..40),
    date: Time.zone.now - rand(1..50).days,
    checkin_notified: rand(0..1),
    checkout_notified: rand(0..1),
    driver_fullname: "Иванов Иван Васильевич",
    phone: "+#{79001001010+i}",
    deal_type: TemporaryStorageWarehouseTransaction.deal_type.values.sample,
    country_code: TemporaryStorageWarehouseTransaction::AVAILABLE_COUNTRIES.sample,
    user: users.sample,
    bill_sent_at: Time.zone.now - rand(1..50).days
  }
}.each do |e|
  TemporaryStorageWarehouseTransaction.create!(e)
end

Selling.delete_all

include SellingItemsHelper

TemporaryStorageWarehouseTransaction.all.each_with_index do |e, i|
  date = Time.zone.now - rand(0..40).days
  s = e.create_selling(
    payed: [true, false].sample,
    company_name: e.company.name,
    num: i,
    agreement_num: e.company.agreement_num,
    date: date,
    planned_payment_date: date + e.company.deferment_of_payment.to_i.days
  )

  tsw_services.sample(5).map do |service|
    s.selling_items.create(
      description: service[:description],
      quantity: rand(1..10),
      measure: service[:measure],
      price: service[:price],
      nds_percent: 18
    )
  end
end
