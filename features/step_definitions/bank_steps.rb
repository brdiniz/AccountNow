Given /^I have a Bank with name "([^\"]*)" and code "([^\"]*)"$/ do |bank_name, bank_code|
  Bank.create!(:name => bank_name, :code => bank_code)
end