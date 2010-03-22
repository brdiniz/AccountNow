Given /^I have a bank account with name "([^\"]*)" and Bank "([^\"]*)"$/ do |bank_account_name, bank_name|
  bank = Bank.find_by_name(bank_name)
  Factory(:bank_account, :bank_id => bank.id, :name => bank_account_name, :opening_balance => "10", :opening_balance_date => "1/5/2011")
end

Given /^The BankAccount named "([^\"]*)" has an account$/ do |bank_account_name|
  b = BankAccount.find_by_name(bank_account_name)
  Factory(:account, :bank_account => b)
end

