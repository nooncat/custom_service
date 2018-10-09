class CreateSellings < ActiveRecord::Migration[5.2]
  def change
    create_table :sellings do |t|
      t.references :temporary_storage_warehouse_transaction, foreign_key: true
      t.text :description
      t.integer :quantity
      t.string :measure
      t.float :price
      t.integer :nds_percent
      t.float :nds_total

      t.timestamps
    end
  end
end
