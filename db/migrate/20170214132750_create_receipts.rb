class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.integer :form_id
      t.string :shipping_address
      t.integer :shipping_poskod
      t.string :shipping_district
      t.string :shipping_country
      t.string :customer_email
      t.string :customer_phone

      t.timestamps
    end
  end
end
