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
  
  it "should redirect show with deleted account" do
    account = Factory(:account)
    bank_account = account.bank_account
    post :account_delete, :bank_account_id => bank_account.id, :id => account.id
    response.should redirect_to(bank_account_path(bank_account))
  end
  
  it 'should redirect show account in the bank_account' do
    account = Factory(:account)
    post :account_edit, :bank_account_id => account.bank_account.id, :id => account.id, :account => {:situation_id => 1}
    response.should redirect_to(bank_account_path(account.bank_account))
  end
  
end