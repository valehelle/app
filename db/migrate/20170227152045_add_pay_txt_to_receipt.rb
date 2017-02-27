class AddPayTxtToReceipt < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :pay_txt, :text
  end
end
