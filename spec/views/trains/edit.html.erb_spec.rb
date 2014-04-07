require 'spec_helper'

describe "trains/edit" do
  before(:each) do
    @train = assign(:train, stub_model(Train,
      :train_line => "MyString",
      :route_name => "MyString",
      :run_number => "MyString",
      :operator_id => "MyString"
    ))
  end

  it "renders the edit train form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", train_path(@train), "post" do
      assert_select "input#train_train_line[name=?]", "train[train_line]"
      assert_select "input#train_route_name[name=?]", "train[route_name]"
      assert_select "input#train_run_number[name=?]", "train[run_number]"
      assert_select "input#train_operator_id[name=?]", "train[operator_id]"
    end
  end
end
