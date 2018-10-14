TemporaryStorageWarehouse.delete_all

storages = [
  {region_num: 73, region_name: 'Ульяновская обл.', address: ''}
].map do |e|
  TemporaryStorageWarehouse.create!(e)
end


User.delete_all

users = [
  {email: 'uln1@test.home', role: :user, password: '123', password_confirmation: '123', temporary_storage_warehouse_id: storages.find{ |e| e.region_num == 73 }.id},
  {email: 'admin1@test.home', role: :admin, password: '123', password_confirmation: '123'}
].each do |e|
  User.create!(e)
end

Company.delete_all

company_names = ['OOO Гранд', 'ОАО Бридж стоун', 'ИП Белов', 'ООО Самара строй', 'ОАО РЖД', 'ОАО Инвест строй', 'ОАО УАЗ', 'ОАО ТАЗ', 'ОАО Камаз', 'ООО Автозапчасть']
(1..10).map { |i|
  {
    name: company_names[i],
    ogrn: 8.times.map{ |e| rand(0..9) }.join(''),
    inn: 8.times.map{ |e| rand(0..9) }.join(''),
    kpp: 8.times.map{ |e| rand(0..9) }.join(''),
    uridicheskiy_address: 'г.Москва. ул. Пушкина, д.101, оф 101',
    real_address: 'г.Москва. ул. Пушкина, д.101, оф 101',
    bank_schet: 8.times.map{ |e| rand(0..9) }.join(''),
    bank_name: 'ПАО БИНБАНК',
    bank_bik: 8.times.map{ |e| rand(0..9) }.join(''),
    bank_city: 'Москва',
    bank_kor_schet: 8.times.map{ |e| rand(0..9) }.join(''),
    phone:  "+#{79001001010+i}",
    email: "compnay_#{i}@test.home"
  }
}.each do |e|
  Company.create!(e)
end

companies = Company.all

TemporaryStorageWarehouseTransaction.delete_all

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
    country_code: TemporaryStorageWarehouseTransaction::AVAILABLE_COUNTRIES.sample
  }
}.each do |e|
  TemporaryStorageWarehouseTransaction.create!(e)
end
