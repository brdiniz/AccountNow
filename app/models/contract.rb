class Contract < ActiveRecord::Base
  belongs_to :person
  has_many :accounts, :dependent => :destroy

  attr_accessor :account_kind
  attr_accessor :account_box_id
  attr_accessor :account_date
  attr_accessor :account_quantity
  attr_accessor :account_price
  attr_accessor :bank_account_id

  validates_presence_of :name, :person_id, :date_registry, :document
  validates_presence_of :account_box_id, :account_kind, :account_date, :account_quantity, :account_price

  after_create :create_accounts

  def create_accounts
    @account_quantity.to_i.times do |i|
      maturity_date = @account_date.to_date.months_since(i)
      self.accounts << Account.create(:bank_account_id => @bank_account_id, :document => "Contrato", :kind => @account_kind, :box_id => @account_box_id, :person => self.person, :price => @account_price, :payment_date => maturity_date, :maturity_date => maturity_date)
    end
  end
end

