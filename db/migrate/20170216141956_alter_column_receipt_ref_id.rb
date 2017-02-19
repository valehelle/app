class AlterColumnReceiptRefId < ActiveRecord::Migration[5.0]
  def change
    def self.up
      change_table :receipt do |t|
        t.change :ref_id, :string
      end
    end
    def self.down
      change_table :products do |t|
        t.change :ref_id, :integer
      end
    end
  end
end
