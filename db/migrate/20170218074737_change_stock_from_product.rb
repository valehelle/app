class ChangeStockFromProduct < ActiveRecord::Migration[5.0]
    def self.up
      change_table :products do |t|
        t.change :stock, :integer, :default => 0
      end
    end
    def self.down
      change_table :products do |t|
        t.change :stock, :integer
      end
    end
end
