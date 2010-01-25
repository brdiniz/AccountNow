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
    person.errors.on(:address).should be_blank
  end
end

