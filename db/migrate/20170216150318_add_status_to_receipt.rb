class AddStatusToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :status, :string, :default => "Waiting Payment"
  end
end
