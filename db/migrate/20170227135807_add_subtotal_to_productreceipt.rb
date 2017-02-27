class AddSubtotalToProductreceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :productreceipts, :subtotal, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end
end
