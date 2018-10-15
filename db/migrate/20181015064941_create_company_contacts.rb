class CreateCompanyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :company_contacts do |t|
      t.string :name
      t.string :middlename
      t.string :lastname
      t.string :phone
      t.string :email
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
