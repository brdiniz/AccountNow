require 'spec_helper'

describe Contract do

  it 'should create' do
    account_quantity  = 5
    contract = Factory(:contract, :account_quantity => account_quantity)
    contract.accounts.size.should == account_quantity
  end
end

