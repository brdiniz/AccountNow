require 'spec_helper'

describe "/banks/index.html.erb" do
  include BanksHelper

  before(:each) do
    assigns[:banks] = [
      stub_model(Bank,
        :code => "value for code",
        :name => "value for name"
      ),
      stub_model(Bank,
        :code => "value for code",
        :name => "value for name"
      )
    ]
  end

  it "renders a list of banks" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
