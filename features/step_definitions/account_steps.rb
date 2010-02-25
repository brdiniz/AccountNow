Given /^The Person named "([^\"]*)" has an account kind "([^\"]*)" and document "([^\"]*)" and box "([^\"]*)" and MaturityDate "([^\"]*)" and Price "([^\"]*)"$/ do |person_name, account_kind, account_document, account_box_name, account_maturity_date, account_price|
  person = Person.find_by_name(person_name)
  box = Box.find_by_name(account_box_name)
  a = Account.create(:person => person, :box_id => box.id, :kind => account_kind, :document => account_document,  :price => account_price, :maturity_date => account_maturity_date)
  puts a.errors.full_messages
end
