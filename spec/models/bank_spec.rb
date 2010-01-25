require 'spec_helper'

describe Bank do

  it "should create a new instance given valid attributes" do
    Factory.create(:bank)
  end

  it "sould not create a new instance given valid attributes" do
    bank = Bank.new
    bank.should_not be_valid
    bank.errors.on(:code).should_not be_blank
    bank.errors.on(:name).should_not be_blank
  end
end

