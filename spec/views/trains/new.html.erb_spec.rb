require 'spec_helper'

describe "trains/new" do
  before(:each) do
    assign(:train, stub_model(Train,
      :train_line => "MyString",
      :route_name => "MyString",
      :run_number => "MyString",
      :operator_id => "MyString"
    ).as_new_record)
  end

  it "renders new train form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trains_path, "post" do
      assert_select "input#train_train_line[name=?]", "train[train_line]"
      assert_select "input#train_route_name[name=?]", "train[route_name]"
      assert_select "input#train_run_number[name=?]", "train[run_number]"
      assert_select "input#train_operator_id[name=?]", "train[operator_id]"
    end
  end
end
