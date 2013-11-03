require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :name => "MyString",
      :position => 1,
      :visible => false,
      :content_type => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", section_path(@section), "post" do
      assert_select "input#section_name[name=?]", "section[name]"
      assert_select "input#section_position[name=?]", "section[position]"
      assert_select "input#section_visible[name=?]", "section[visible]"
      assert_select "input#section_content_type[name=?]", "section[content_type]"
      assert_select "textarea#section_content[name=?]", "section[content]"
    end
  end
end
