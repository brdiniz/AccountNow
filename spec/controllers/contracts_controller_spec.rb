require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  integrate_views

  it 'should redirect person when contract save' do
    person = Factory(:person)
    box = Factory(:box)
    post :create, :contract => {:name => "nome", :person_id => person.id, :date_registry => "1/1/2010", :document => "1", :account_box_id => box.id, :account_kind => "a receber", :account_date => "1/1/2011", :account_quantity => "1", :account_price => "10"}, :person_id => person.id
    response.should redirect_to(person_path(person))
  end
end

