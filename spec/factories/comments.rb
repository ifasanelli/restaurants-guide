FactoryBot.define do
  factory :comment do
    body { "MyText" }
    restaurant { nil }
    status { 1 }
  end
end
