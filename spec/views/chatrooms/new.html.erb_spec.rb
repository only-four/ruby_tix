require 'rails_helper'

RSpec.describe "chatrooms/new", type: :view do
  before(:each) do
    assign(:chatroom, Chatroom.new(
      name: "MyString"
    ))
  end

  it "renders new chatroom form" do
    render

    assert_select "form[action=?][method=?]", chatrooms_path, "post" do

      assert_select "input[name=?]", "chatroom[name]"
    end
  end
end
