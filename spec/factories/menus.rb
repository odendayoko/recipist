FactoryBot.define do
  factory :menu do
    name              {'hoge'}
    url               {'example.com'}
    memo              {'hogehoge'}
    user_id           {@user}
  end
end
