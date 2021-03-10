FactoryBot.define do
  factory :seat do
    seat_number { "MyString" }
    event { 1 }
    available { false }
  end
end
