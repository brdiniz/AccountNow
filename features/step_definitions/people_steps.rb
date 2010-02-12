Given /^I have new Person with name is "([^\"]*)"$/ do |person_name|
  Person.create(:name => person_name, :identifier => "10", :tipe => "FISICA")
end

