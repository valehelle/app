class AddUserIdToProductreceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :productreceipts, :user_id, :integer
  end
end
