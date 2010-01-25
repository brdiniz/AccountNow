require 'spec_helper'

describe "/banks/show.html.erb" do
  include BanksHelper
  before(:each) do
    assigns[:bank] = @bank = stub_model(Bank,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ name/)
  end
end
