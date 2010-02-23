require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PeopleController do
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

end

