require 'rails_helper'

RSpec.describe "chatrooms/index", type: :view do
  before(:each) do
    assign(:chatrooms, [
      Chatroom.create!(
        name: "Name"
      ),
      Chatroom.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of chatrooms" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
