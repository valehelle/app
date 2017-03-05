class AddPoskodFromCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :poskod, :string
  end
end
