FactoryBot.define do
  factory :post do
    title { 'test-post' }
    address { '大阪府大阪市港区海岸通１丁目１' }
    content { Faker::Lorem.word }
    user
  end
end
