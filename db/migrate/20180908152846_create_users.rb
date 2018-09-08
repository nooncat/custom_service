class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.references :temporary_storage_warehouse, foreign_key: true

      t.timestamps
    end
  end
end
