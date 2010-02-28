require 'spec_helper'

describe Account do

  it "should create a new instance given valid attributes" do
    Factory.create(:account)
  end

  it "should not create a new instance given invalid attributes" do
    account = Account.new
    account.should_not be_valid
    account.errors.on(:bank_account_id).should_not be_blank
    account.errors.on(:kind).should_not be_blank
    account.errors.on(:document).should_not be_blank
    account.errors.on(:person_id).should_not be_blank
    account.errors.on(:price).should_not be_blank
    account.errors.on(:maturity_date).should_not be_blank
    account.errors.on(:box_id).should_not be_blank
  end

end

