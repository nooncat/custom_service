class CreateInvoiceNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_notifications do |t|
      t.references :selling

      t.timestamps
    end
  end
end
