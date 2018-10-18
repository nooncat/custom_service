class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.string :recpient
      t.string :subject
      t.text :body
      t.references :user, foreign_key: true
      t.references :temporary_storage_warehouse_transaction, foreign_key: true, index: {name: "temporary_storage_warehouse_transaction_id"}

      t.timestamps
    end
  end
end
