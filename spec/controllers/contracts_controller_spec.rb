require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  it_should_behave_like "authenticated controller"
  integrate_views

  it 'should redirect person when contract save' do
    person = Factory(:person)
    box = Factory(:box)
    post :create, :contract => {:name => "nome", :person_id => person.id, :date_registry => "1/1/2010", :document => "1", :account_box_id => box.id, :account_kind => "a receber", :account_date => "1/1/2011", :account_quantity => "1", :account_price => "10"}, :person_id => person.id
    response.should redirect_to(person_path(person))
  end

  it 'should redirect person when destroy account' do
    contract = Factory(:contract)
    post :destroy, :id => contract.id, :person_id => contract.person.id
    response.should redirect_to(person_path(contract.person))
  end

  it 'should redirect person when not destroy account' do
    ac = Factory(:account)
    post :destroy, :id => 0, :person_id => ac.person.id
    response.should redirect_to(person_path(ac.person))
  end

end

