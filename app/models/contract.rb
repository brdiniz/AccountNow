class Contract < ActiveRecord::Base
  belongs_to :person
  has_many :accounts, :dependent => :destroy

  attr_accessor :account_kind
  attr_accessor :account_box_id
  attr_accessor :account_date
  attr_accessor :account_quantity
  attr_accessor :account_price

  validates_presence_of :name, :person_id, :date_registry, :document
  validates_presence_of :account_box_id, :account_kind, :account_date, :account_quantity, :account_price

  after_create :create_accounts

  def create_accounts
    @account_quantity.to_i.times do |i|
      self.accounts << Account.create(:document => "Contrato", :kind => @account_kind, :box_id => @account_box_id, :person => self.person, :price => @account_price, :maturity_date => @account_date)
    end
  end
end

