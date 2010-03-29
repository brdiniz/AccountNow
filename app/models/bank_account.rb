class BankAccount < ActiveRecord::Base

  include AccountsHelper

  belongs_to :bank
  has_many :accounts

  validates_presence_of :name, :bank_id, :opening_balance
  validates_uniqueness_of :name
  after_create :create_opening_balance
  
  def create_opening_balance
    kind = "a pagar" if self.opening_balance < 0
    kind = "a receber" if self.opening_balance > 0
    return true if self.opening_balance == 0
    Account.create!(:situation => Situation.find_by_name("Realizada"), :person_id => self.bank.id, :kind => kind, :maturity_date => self.opening_balance_date, :payment_price => self.opening_balance, :price => self.opening_balance, :document => "saldo inicial", :payment_date => self.opening_balance_date, :bank_account => self, :box => Box.first)
  end

end

