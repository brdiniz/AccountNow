Given /^The Person named "([^\"]*)" has an account kind "([^\"]*)" and document "([^\"]*)" and box "([^\"]*)" and Price "([^\"]*)"$/ do |person_name, account_kind, account_document, account_box_name, account_price|
  person = Person.find_by_name(person_name)
  box = Box.find_by_name(account_box_name)
  account_maturity_date = DateTime.now
  bank_account = Factory(:bank_account, :opening_balance_date => account_maturity_date)
  a = Account.create(:person => person, :bank_account_id => bank_account.id, :box_id => box.id, :kind => account_kind, :document => account_document,  :price => account_price, :maturity_date => account_maturity_date)
  puts a.errors.full_messages
end

