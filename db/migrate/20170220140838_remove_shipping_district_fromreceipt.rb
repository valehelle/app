class RemoveShippingDistrictFromreceipt < ActiveRecord::Migration[5.0]
  def up
    remove_column :receipts, :shipping_district
  end
  def down
    add_column :receipts, :shipping_district, :string
  end
end
