require 'spec_helper'

describe "pages/new" do
  before(:each) do
    assign(:page, stub_model(Page,
      :name => "MyString",
      :permalink => "MyString",
      :position => 1,
      :visible => false
    ).as_new_record)
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pages_path, "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_permalink[name=?]", "page[permalink]"
      assert_select "input#page_position[name=?]", "page[position]"
      assert_select "input#page_visible[name=?]", "page[visible]"
    end
  end
end
