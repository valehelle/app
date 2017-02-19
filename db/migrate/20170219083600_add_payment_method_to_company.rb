class AddPaymentMethodToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :payment_method, :text
  end
end
