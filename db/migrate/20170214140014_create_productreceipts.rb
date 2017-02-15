class CreateProductreceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :productreceipts do |t|
      t.integer :receipt_id
      t.string :name
      t.string :desc
      t.integer :price

      t.timestamps
    end
  end
end
