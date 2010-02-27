class Bank < ActiveRecord::Base
  has_many :bank_accounts, :dependent => :destroy

  validates_presence_of :code, :name
end

