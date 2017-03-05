class AddCityToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :city, :string
  end
end
