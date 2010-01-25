Given /^I have no (.+)$/ do |class_name|
  eval(class_name).destroy_all
end

Then /^I should have ([0-9]+) (.+)?$/ do |count, class_name|
  eval(class_name.capitalize).count.should == count.to_i
end

