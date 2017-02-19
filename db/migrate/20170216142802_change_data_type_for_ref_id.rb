class ChangeDataTypeForRefId < ActiveRecord::Migration[5.0]
    def self.up
      change_table :receipts do |t|
        t.change :ref_id, :string
      end
    end
    def self.down
      change_table :receipts do |t|
        t.change :ref_id, :integer
      end
    end
end
