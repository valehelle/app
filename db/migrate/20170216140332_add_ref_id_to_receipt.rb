class AddRefIdToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :ref_id, :integer
  end
end
