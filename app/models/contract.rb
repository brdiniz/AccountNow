class Contract < ActiveRecord::Base
  belongs_to :person
  has_many :accounts

  attr_accessor :account_kind
  attr_accessor :account_box_id
  attr_accessor :account_date
  attr_accessor :attr_names
  attr_accessor :account_quantity
  attr_accessor :account_price

end

