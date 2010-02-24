class AddBoxToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :box_id, :int
  end

  def self.down
    remove_column :accounts, :box_id
  end
end
