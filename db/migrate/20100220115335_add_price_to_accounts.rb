class AddPriceToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :price, :decimal
  end

  def self.down
    remove_column :accounts, :price
  end
end
