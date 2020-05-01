FactoryBot.define do
  factory :user do
    email { 'teste@teste.com' }
    password { '123456' }
    name { 'Testonildo' }
    role { 0 }
  end
end
