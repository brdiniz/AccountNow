class Bank < ActiveRecord::Base
  has_many :bank_accounts

  validates_presence_of :code, :name
end

