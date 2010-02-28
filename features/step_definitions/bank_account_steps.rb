Given /^I have a bank account with name "([^\"]*)" and Bank "([^\"]*)"$/ do |bank_account_name, bank_name|
  bank = Bank.find_by_name(bank_name)
  BankAccount.create!(:bank_id => bank.id, :name => bank_account_name, :opening_balance => "10", :opening_balance_date => "1/5/2011")
end

