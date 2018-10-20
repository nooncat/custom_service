class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
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
      # t.references :users, foreign_key: true

      t.string :agreement_num
      t.integer :discount
      t.integer :deferment_of_payment
      t.string :director

      t.timestamps
    end
  end
end
