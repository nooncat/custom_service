class CreateTemporaryStorageWarehouseTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :temporary_storage_warehouse_transactions do |t|
      t.string :vehicle_number
      t.string :vehicle_type
      t.string :state
      t.integer :pallet_count

      t.datetime :date
      t.datetime :checkin_date
      t.datetime :checkout_date

      t.boolean :checkin_notified
      t.boolean :checkout_notified

      t.string :driver_fullname
      t.string :phone
      t.string :deal_type
      t.string :country_code

      t.references :company, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
