class AddProductIdToProductreceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :productreceipts, :product_id, :integer
  end
end
