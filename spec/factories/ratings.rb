FactoryBot.define do
  factory :rating do
    star { 1 }
    restaurant
    user
  end
end
