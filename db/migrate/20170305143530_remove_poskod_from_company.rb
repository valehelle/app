class RemovePoskodFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :poskod, :integer
  end
end
