class RemoveShippingPoskodFromReceipt < ActiveRecord::Migration[5.0]
  def change
    remove_column :receipts, :shipping_poskod, :integer
  end
end
