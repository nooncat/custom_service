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

TemporaryStorageWarehouseTransaction.delete_all

letters = %w[A B C E O P T]
(1..100).map { |i|
  {
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
