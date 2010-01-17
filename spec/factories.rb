Factory.define :person do |f|
  f.sequence(:name) { |n| "p#{n}" }
end

