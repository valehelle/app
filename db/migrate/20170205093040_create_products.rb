class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.decimal :price
      t.integer :stock
      t.boolean :editable

      t.timestamps
    end
  end
end
