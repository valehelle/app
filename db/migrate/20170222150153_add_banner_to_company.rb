class AddBannerToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :banner, :string
  end
end
