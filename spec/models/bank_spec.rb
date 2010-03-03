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
  
  it "should sort by name" do
    banks = []
    banks << Factory(:bank, :code => "d")
    banks << Factory(:bank, :code => "a")
    banks << Factory(:bank, :code => "c")
    banks << Factory(:bank, :code => "b")
    banks
    banks.sort!
    banks.delete_at(0).code.should == "a"
    banks.delete_at(0).code.should == "b"
    banks.delete_at(0).code.should == "c"
    banks.delete_at(0).code.should == "d"
  end
end

