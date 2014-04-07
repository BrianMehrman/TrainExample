require 'spec_helper'

describe "trains/show" do
  before(:each) do
    @train = assign(:train, stub_model(Train,
      :train_line => "Train Line",
      :route_name => "Route",
      :run_number => "Run Number",
      :operator_id => "Operator"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Train Line/)
    rendered.should match(/Route/)
    rendered.should match(/Run Number/)
    rendered.should match(/Operator/)
  end
end
