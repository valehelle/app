class AddQtyToProductreceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :productreceipts, :qty, :integer
  end
end
