class CreateTemporaryStorageWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :temporary_storage_warehouses do |t|
      t.string :region_name
      t.integer :region_num

      t.string :name
      t.string :ogrn
      t.string :inn
      t.string :kpp
      t.string :uridicheskiy_address
      t.string :real_address
      t.string :bank_schet
      t.string :bank_name
      t.string :bank_bik
      t.string :bank_city
      t.string :bank_kor_schet
      t.string :phone
      t.string :email

      t.string :director

      t.timestamps
    end
  end
end
