class AddBankAccountToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :bank_account_id, :int
  end

  def self.down
    remove_column :accounts, :bank_account_id
  end
end
