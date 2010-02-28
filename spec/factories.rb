Factory.define :contract do |f|
  f.name "teste"
  f.date_registry "1/1/2011"
  f.document "doc_1"
  f.account_kind "a receber"
  f.account_date "1/2/2011"
  f.account_quantity "10"
  f.account_price "10"
  f.account_box_id {|p| Factory(:box).id }
  f.association :person, :factory => :person
end

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
  f.document "doc_12"
  f.association :bank_account, :factory => :bank_account
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

