class CreateTemporaryStorageWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :temporary_storage_warehouses do |t|
      t.string :region_name
      t.string :address
      t.integer :region_num

      t.timestamps
    end
  end
end
