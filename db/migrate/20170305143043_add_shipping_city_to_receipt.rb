class AddShippingCityToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :shipping_city, :string
  end
end
