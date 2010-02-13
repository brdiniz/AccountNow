Factory.define :person do |f|
  f.sequence(:name) { |n| "p#{n}" }
  f.tipe "FISICA"
  f.sequence(:identifier) { |n| "cpf_#{n}" }
end

Factory.define :bank do |f|
  f.sequence(:code) { |n| "code#{n}" }
  f.name "bank_bla_ble_bli"
end

