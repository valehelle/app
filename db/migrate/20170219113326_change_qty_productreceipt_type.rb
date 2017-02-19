class ChangeQtyProductreceiptType < ActiveRecord::Migration[5.0]
    def self.up
      change_table :productreceipts do |t|
        t.change :qty, :integer, :default => 0
      end
    end
    def self.down
      change_table :productreceipts do |t|
        t.change :qty, :integer
      end
    end
end
