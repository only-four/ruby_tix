FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    activity { nil }
  end
end
