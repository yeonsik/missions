require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :user_id => 1,
      :title => "MyString",
      :entry => "MyText"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_user_id[name=?]", "post[user_id]"
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_entry[name=?]", "post[entry]"
    end
  end
end