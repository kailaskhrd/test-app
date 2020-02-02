FactoryBot.define do
  factory :address do
    line_1 { "MyText" }
    line_2 { "MyText" }
    city { "MyString" }
    state { "MyString" }
    pincode { "MyString" }
    landmark { "MyString" }
    country { "MyString" }
    user { nil }
  end
end
