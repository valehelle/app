class AddNameToForm < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :name, :string
  end
end
