Given /^I have new Box with name is "([^\"]*)"$/ do |box_name|
  Box.create(:name => box_name)
end

