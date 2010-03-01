class Bank < ActiveRecord::Base
  belongs_to :person
  has_many :bank_accounts, :dependent => :destroy

  validates_presence_of :code, :name, :person_id

  validates_uniqueness_of :code
end

