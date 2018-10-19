class CreateSellingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :selling_items do |t|
      t.references :selling, foreign_key: true
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
