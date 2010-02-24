class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.string :name
      t.int :bank_id
      t.decimal :opening_balance
      t.date :openin_balance_date

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
