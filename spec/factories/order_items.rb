FactoryBot.define do
  factory :order_item do
    order { nil }
    activities_title { "MyString" }
    ticket_types_title { "MyString" }
    quantity { 1 }
  end
end
