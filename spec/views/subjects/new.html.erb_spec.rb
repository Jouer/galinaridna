require 'spec_helper'

describe "subjects/new" do
  before(:each) do
    assign(:subject, stub_model(Subject,
      :name => "MyString",
      :position => 1,
      :visible => false
    ).as_new_record)
  end

  it "renders new subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subjects_path, "post" do
      assert_select "input#subject_name[name=?]", "subject[name]"
      assert_select "input#subject_position[name=?]", "subject[position]"
      assert_select "input#subject_visible[name=?]", "subject[visible]"
    end
  end
end
