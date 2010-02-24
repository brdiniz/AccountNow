class RenameOpeningGenerateDateToBankAccount < ActiveRecord::Migration
  def self.up
    remove_column :bank_accounts, :openin_balance_date
    add_column :bank_accounts, :opening_balance_date, :date
  end

  def self.down
    remove_column :bank_accounts, :opening_balance_date
    add_column :bank_accounts, :openin_balance_date, :date
  end
end

