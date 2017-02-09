class CreateFormproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :formproducts do |t|
      t.integer :form_id
      t.integer :product_id

      t.timestamps
    end
  end
end
