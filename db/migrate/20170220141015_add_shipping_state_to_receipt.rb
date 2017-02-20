class AddShippingStateToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :shipping_state, :string
  end
end
