require 'spec_helper'

describe "parts/new" do
  before(:each) do
    assign(:part, stub_model(Part,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parts_path, "post" do
      assert_select "input#part_description[name=?]", "part[description]"
    end
  end
end
