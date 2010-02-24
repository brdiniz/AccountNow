Factory.define :person do |f|
  f.sequence(:name) { |n| "p#{n}" }
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
  f.association :person, :factory => :person
end

Factory.define :box do |f|
  f.sequence(:name) { |n| "box_#{n}" }
end

