require 'spec_helper'

describe BankAccount do

  it "should create a new instance given valid attributes" do
    Factory.create(:bank_account)
  end

end

