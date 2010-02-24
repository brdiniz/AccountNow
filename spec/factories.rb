Factory.define :person do |f|
  f.sequence(:name) { |n| "p#{n}" }
  f.sequence(:email) { |n| "email_#{n}" }
  f.tipe "FISICA"
  f.sequence(:identifier) { |n| "cpf_#{n}" }
end

Factory.define :bank do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "bank_bla_ble_bli"
end

Factory.define :account do |f|
  f.kind "a receber"
  f.price "10"
  f.maturity_date "1/1/2011"
  f.association :box, :factory => :box
  f.association :person, :factory => :person
end

Factory.define :bank_account do |f|
  f.name "name"
  f.opening_balance "10"
  f.opening_balance_date "1/5/2011"
  f.association :bank, :factory => :bank
end

Factory.define :box do |f|
  f.sequence(:name) { |n| "box_#{n}" }
end

