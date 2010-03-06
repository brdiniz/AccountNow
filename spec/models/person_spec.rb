require 'spec_helper'

describe Person do

  it "should create a new instance given valid attributes" do
    Factory.create(:person)
  end

  it 'should not create a new instace given valid attributes' do
    person = Person.new
    person.should be_invalid
    person.errors.on(:name).should_not be_blank
    person.errors.on(:tipe).should_not be_blank
    person.errors.on(:email).should_not be_blank
    person.errors.on(:address).should be_blank
    person.errors.on(:identifier).should_not be_blank
  end

  it 'should not create a new instace given a identifier exist' do
    Factory(:person, :identifier => "123456")
    person = Factory.build(:person, :identifier => "123456")
    person.should_not be_valid
    person.errors.on(:identifier).should_not be_blank
  end

  it "should sort by name" do
    people = []
    people << Factory(:person, :name => "d")
    people << Factory(:person, :name => "a")
    people << Factory(:person, :name => "c")
    people << Factory(:person, :name => "b")
    people
    people.sort!
    people.delete_at(0).name.should == "a"
    people.delete_at(0).name.should == "b"
    people.delete_at(0).name.should == "c"
    people.delete_at(0).name.should == "d"
  end

  it 'should sort by account payment date' do
    person = Factory(:person)
    Factory(:account, :person => person, :payment_date => "03/01/2010")
    Factory(:account, :person => person, :payment_date => "03/02/2010")
    Factory(:account, :person => person, :payment_date => "03/03/2010")
    Factory(:account, :person => person, :payment_date => "03/04/2010")
    accounts = []
    accounts = person.find_account_month_year("03", "2010")
    accounts[0].payment_date.to_s.should == "2010-03-01"
    accounts[1].payment_date.to_s.should == "2010-03-02"
    accounts[2].payment_date.to_s.should == "2010-03-03"
    accounts[3].payment_date.to_s.should == "2010-03-04"
  end
end

