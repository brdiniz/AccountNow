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

end

