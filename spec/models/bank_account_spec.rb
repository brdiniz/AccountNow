require 'spec_helper'

describe BankAccount do

  it "should create a new instance given valid attributes" do
    Factory.create(:bank_account)
  end
  
  it "should sum payment account" do
    b = Factory(:bank_account)
    a = Factory(:account, :bank_account_id => b.id, :payment_date => "3/1/2010")
    a = Factory(:account, :bank_account_id => b.id, :payment_date => "3/1/2010")

    b.price_sum(4, 2010).to_i.should == 20
    b.payment_sum(4, 2010).to_i.should == 0
    
    a.situation == Situation.find_by_name("Realizada")
    a.payment_price = 25
    a.save_payment
    
    b.price_sum(4, 2010).to_i.should == 20
    b.payment_sum(4, 2010).to_i.should == 25
  end

end

