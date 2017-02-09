class AddRefIdToForm < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :ref_id, :string
  end
end
