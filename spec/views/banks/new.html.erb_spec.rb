require 'spec_helper'

describe "/banks/new.html.erb" do
  include BanksHelper

  before(:each) do
    assigns[:bank] = stub_model(Bank,
      :new_record? => true,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "renders new bank form" do
    render

    response.should have_tag("form[action=?][method=post]", banks_path) do
      with_tag("input#bank_code[name=?]", "bank[code]")
      with_tag("input#bank_name[name=?]", "bank[name]")
    end
  end
end
