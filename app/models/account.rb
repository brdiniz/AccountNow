class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :box

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :person_id, :price, :maturity_date, :box_id
end

