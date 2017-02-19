class AddCustomerNameToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :customer_name, :string
  end
end
