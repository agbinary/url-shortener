FactoryBot.define do
  factory :url do
    original Faker::Internet.url
    shortened Faker::Lorem.characters(7)
  end
end
