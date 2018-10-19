class CreateSellings < ActiveRecord::Migration[5.2]
  def change
    create_table :sellings do |t|
      t.references :temporary_storage_warehouse_transaction, foreign_key: true
      t.references :temporary_storage_warehouse, foreign_key: true

      t.string :company_name
      t.string :num
      t.string :agreement_num
      t.datetime :date
      t.datetime :planned_payment_date

      t.timestamps
    end
  end
end
