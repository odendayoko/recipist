FactoryBot.define do
  factory :menu do
    name              {Faker::Lorem.sentence}
    url               {Faker::Lorem.sentence}
    memo              {Faker::Lorem.sentence}
    association :user
  end
end
