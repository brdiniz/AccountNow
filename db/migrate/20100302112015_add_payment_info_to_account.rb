class AddPaymentInfoToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :payment_date, :date
    add_column :accounts, :payment_price, :decimal
  end

  def self.down
    remove_column :accounts, :payment_price
    remove_column :accounts, :payment_date
  end
end
