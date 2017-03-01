class AddShippingNumberToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :shipping_number, :string
  end
end
