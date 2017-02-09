class AddFormToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :form_id, :integer
  end
end
