class ChangePriceStockFromProduct < ActiveRecord::Migration[5.0]
    def self.up
      change_table :products do |t|
        t.change :price, :decimal, :precision => 8, :scale => 2, :default => 0.00
      end
    end
    def self.down
      change_table :products do |t|
        t.change :price, :decimal, :precision => 8, :scale => 2
      end
    end
end
