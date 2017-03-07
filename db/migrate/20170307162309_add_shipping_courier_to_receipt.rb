class AddShippingCourierToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :shipping_courier, :string
  end
end
