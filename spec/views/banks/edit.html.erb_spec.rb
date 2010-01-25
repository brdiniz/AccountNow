require 'spec_helper'

describe "/banks/edit.html.erb" do
  include BanksHelper

  before(:each) do
    assigns[:bank] = @bank = stub_model(Bank,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name"
    )
  end

  it "renders the edit bank form" do
    render

    response.should have_tag("form[action=#{bank_path(@bank)}][method=post]") do
      with_tag('input#bank_code[name=?]', "bank[code]")
      with_tag('input#bank_name[name=?]', "bank[name]")
    end
  end
end
