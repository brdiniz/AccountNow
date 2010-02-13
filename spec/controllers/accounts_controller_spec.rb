require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountsController do
  integrate_views

  it 'should redirect person when account save' do
    p = Factory(:person)
    post :create, :account => {:kind => "nome"}, :person_id => p.id
    response.should redirect_to(person_path(Person.first))
  end

end

