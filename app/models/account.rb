class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :box
  belongs_to :contract
  belongs_to :bank_account

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :bank_account_id, :person_id, :document, :price, :maturity_date, :box_id

end

