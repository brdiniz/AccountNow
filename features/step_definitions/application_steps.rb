Given /^I have no Person$/ do
  Person.destroy_all
end

Then /^I should have ([0-9]+) person?$/ do |count|
  Person.count.should == count.to_i
end

