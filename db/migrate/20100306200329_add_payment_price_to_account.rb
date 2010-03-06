class AddPaymentPriceToAccount < ActiveRecord::Migration
  def self.up
    Account.find(:all, :conditions => ["payment_date is null"]).each do |a|
      a.payment_date = a.maturity_date
      a.save
    end
  end

  def self.down
  end
end

