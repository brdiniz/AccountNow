require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attributes = {
      :name => "Bruno Diniz"
    }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@valid_attributes)
  end

  it 'should not create a new instace give valid attributes' do
    person = Person.new
    person.should be_invalid
    person.errors.on(:name).should_not be_blank
  end
end

