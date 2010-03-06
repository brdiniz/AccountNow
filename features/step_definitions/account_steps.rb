Given /^The Person named "([^\"]*)" has an account kind "([^\"]*)" and document "([^\"]*)" and box "([^\"]*)" and Price "([^\"]*)"$/ do |person_name, account_kind, account_document, account_box_name, account_price|
  person = Person.find_by_name(person_name)
  box = Box.find_by_name(account_box_name)
  bank_account = Factory(:bank_account, :opening_balance_date => DateTime.now)
  a = Factory(:account, :person => person, :bank_account_id => bank_account.id, :box_id => box.id, :kind => account_kind, :document => account_document,  :price => account_price, :payment_date => DateTime.now, :maturity_date => DateTime.now)
end

