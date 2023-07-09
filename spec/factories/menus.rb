FactoryBot.define do
  factory :menu do
    name              {Faker::Food.dish}
    url               {Faker::Internet.url}
    memo              {Faker::Lorem.sentence}
    association :user
    after(:build) do |menu|
      menu.image.attach(io: File.open('spec/fixtures/images/test.jpeg'), filename: 'test.jpeg', content_type: 'image/jpeg')
    end
  end
end
