require 'rails_helper'

RSpec.describe "chatrooms/edit", type: :view do
  before(:each) do
    @chatroom = assign(:chatroom, Chatroom.create!(
      name: "MyString"
    ))
  end

  it "renders the edit chatroom form" do
    render

    assert_select "form[action=?][method=?]", chatroom_path(@chatroom), "post" do

      assert_select "input[name=?]", "chatroom[name]"
    end
  end
end
