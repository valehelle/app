class AddShippingCityToProductreceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :productreceipts, :shipping_city, :string
  end
end
