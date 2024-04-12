FactoryBot.define do
  factory :user do
    name { 'test_user' }
    email { Faker::Internet.free_email(domain: 'gmail.com') }
    password { 'Test123' }
    password_confirm { 'Test123' }
  end
end