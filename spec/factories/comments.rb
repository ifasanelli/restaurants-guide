FactoryBot.define do
  factory :comment do
    body { "Muito bom!" }
    restaurant
    status { 0 }
    user
  end
end
