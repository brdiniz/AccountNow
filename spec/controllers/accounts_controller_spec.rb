require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountsController do
  integrate_views

  it 'should redirect person when account save' do
    p = Factory(:person)
    b = Factory(:box)
    bank_account = Factory(:bank_account)
    post :create, :account => {:bank_account_id => bank_account.id, :box_id => b.id, :kind => "nome", :document => "doc_1", :price => "1", :maturity_date => "1/1/2020", :payment_date => "1/1/2020"}, :person_id => p.id
    response.should redirect_to(person_path(p))
  end

  it 'should redirect person when destroy account' do
    ac = Factory(:account)
    post :destroy, :id => ac.id, :person_id => ac.person.id
    response.should redirect_to(person_path(ac.person))
  end

  it 'should redirect person when not destroy account' do
    ac = Factory(:account)
    post :destroy, :id => 0, :person_id => ac.person.id
    response.should redirect_to(person_path(ac.person))
  end

end

