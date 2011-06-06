class AddPriceToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :integer 
  end

  def self.down
    remove_column :line_items, :price
  end
end
