require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :permalink => "MyString",
      :position => 1,
      :visible => false
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_permalink[name=?]", "page[permalink]"
      assert_select "input#page_position[name=?]", "page[position]"
      assert_select "input#page_visible[name=?]", "page[visible]"
    end
  end
end
