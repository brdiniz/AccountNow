class RemoveAccountTypeFromAccount < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :account_id
    remove_column :accounts, :account_type
    add_column :accounts, :kind, :string
  end

  def self.down
    add_column :accounts, :account_id, :integer
    add_column :accounts, :account_type, :string
    remove_column :accounts, :kind
  end
end

