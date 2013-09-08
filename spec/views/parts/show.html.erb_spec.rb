require 'spec_helper'

describe "parts/show" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
