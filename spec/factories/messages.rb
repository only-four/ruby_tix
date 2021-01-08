FactoryBot.define do
  factory :message do
    chatroom { nil }
    user { nil }
    body { "MyText" }
  end
end
