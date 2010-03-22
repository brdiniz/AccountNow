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

  it "should redirect show with deleted account" do
    account = Factory(:account)
    box = account.box
    post :account_delete, :box_id => box.id, :id => account.id
    response.should redirect_to(box_path(box))
  end

  it 'should redirect show with month and year equals current date' do
    account = Factory(:account)
    get :show, :id => account.box.id
    assigns[:box].should == account.box
    assigns[:month].to_i.should == DateTime.now.month
    assigns[:year].should == DateTime.now.year
  end

  it 'should redirect show with month and year specific' do
    account = Factory(:account)
    get :show, :box_id => account.box.id, :month_number => "10", :year_number => "2012"
    assigns[:box].should == account.box
    assigns[:month].to_i.should == 10
    assigns[:year].to_i.should == 2012
  end

  it "should not update account in the box" do
    account = Factory(:account)
    post :account_edit, :box_id => account.box.id, :id => account.id, :account => {:situation_id => 2}

    Account.find(account.id).situation.should == nil
    response.should_not redirect_to(box_path(account.box))
  end

end

