class AddBankIdToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :bank_id, :integer
  end

  def self.down
    remove_column :bank_accounts, :bank_id
  end
end
