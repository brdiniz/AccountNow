class BankAccount < ActiveRecord::Base
  belongs_to :bank

  validates_presence_of :name, :bank_id
  validates_uniqueness_of :name

end

