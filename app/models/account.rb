class Account < ActiveRecord::Base
  belongs_to :person

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :person_id, :price, :maturity_date
end

