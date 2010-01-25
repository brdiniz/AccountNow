Given /^I have new Person with name is "([^\"]*)"$/ do |person_name|
  Person.create(:name => person_name, :tipe => "FISICA")
end

