class RemoveDistrictFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :district, :string
  end
end
