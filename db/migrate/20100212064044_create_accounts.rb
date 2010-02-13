class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :account_id
      t.string :account_type

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
