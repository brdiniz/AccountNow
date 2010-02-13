require 'spec_helper'

describe Company do

  it 'should not create company when existing person' do
    person = Factory(:person)
    company = Company.create!(:people_id => person)
    company_2 = Company.create(:people_id => person)
    company_2.should_not be_valid
  end
end

