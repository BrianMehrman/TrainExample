require 'spec_helper'

describe "trains/index" do
  before(:each) do
    assign(:trains, [
      stub_model(Train,
        :train_line => "Train Line",
        :route_name => "Route",
        :run_number => "Run Number",
        :operator_id => "Operator"
      ),
      stub_model(Train,
        :train_line => "Train Line",
        :route_name => "Route",
        :run_number => "Run Number",
        :operator_id => "Operator"
      )
    ])
  end

  it "renders a list of trains" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Train Line".to_s, :count => 2
    assert_select "tr>td", :text => "Route".to_s, :count => 2
    assert_select "tr>td", :text => "Run Number".to_s, :count => 2
    assert_select "tr>td", :text => "Operator".to_s, :count => 2
  end

  it "renders an upload button" do
    render

    assert_select "input[type='file']", name: "upload_file"
  end
end
