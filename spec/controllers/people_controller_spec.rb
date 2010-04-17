require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PeopleController do
  it_should_behave_like "authenticated controller"
  integrate_views

  it 'should redirect list person when destroy person' do
    p = Factory(:person)
    post :destroy, :id => p.id
    response.should redirect_to(people_path)
  end

  it 'should redirect person when not destroy account' do
    post :destroy, :id => 0
    response.should redirect_to(people_path)
  end

  it 'should redirect show with month and year equals current date' do
    account = Factory(:account)
    get :show, :id => account.person.id
    assigns[:person].should == account.person
    assigns[:month].to_i.should == DateTime.now.month
    assigns[:year].should == DateTime.now.year
  end

  it 'should redirect show with month and year specific' do
    account = Factory(:account)
    get :show, :person_id => account.person.id, :month_number => "10", :year_number => "2012"
    assigns[:person].should == account.person
    assigns[:month].to_i.should == 10
    assigns[:year].to_i.should == 2012
  end

end

