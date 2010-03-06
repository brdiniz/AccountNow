require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BankAccountsController do
  integrate_views

  it 'should redirect show with month and year equals current date' do
    account = Factory(:account)
    get :show, :id => account.bank_account.id
    assigns[:bank_account].should == account.bank_account
    assigns[:month].to_i.should == DateTime.now.month
    assigns[:year].should == DateTime.now.year
  end

  it 'should redirect show with month and year specific' do
    account = Factory(:account)
    get :show, :bank_account_id => account.bank_account.id, :month_number => "10", :year_number => "2012"
    assigns[:bank_account].should == account.bank_account
    assigns[:month].to_i.should == 10
    assigns[:year].to_i.should == 2012
  end

end

