class AddShippingPoskodFromReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :shipping_poskod, :string
  end
end
