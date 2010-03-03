require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoxesController do
  integrate_views

  it 'should redirect person when destroy box' do
    box = Factory(:box)
    post :destroy, :id => box.id
    response.should redirect_to(boxes_path)
  end

  it 'should redirect person when not destroy box' do
    post :destroy, :id => 0
    response.should redirect_to(boxes_path)
  end

  it 'should redirect show account in the box' do
    account = Factory(:account)
    get :account, :box_id => account.box.id, :id => account.id
    assigns[:account].should == account
    assigns[:box].should == account.box
  end


  it 'should redirect show account in the box' do
    account = Factory(:account)
    get :account_edit, :box_id => account.box.id, :id => account.id
    assigns[:account].should == account
    assigns[:box].should == account.box
  end
  
  it 'should redirect show account in the box' do
    account = Factory(:account)
    post :account_edit, :box_id => account.box.id, :id => account.id, :account => {:situation_id => 1}
    response.should redirect_to(box_path(account.box))
  end

end

