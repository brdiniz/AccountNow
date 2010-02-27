class AddContractToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :contract_id, :int
  end

  def self.down
    remove_column :accounts, :contract_id
  end
end
