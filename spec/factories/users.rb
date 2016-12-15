FactoryGirl.define do
  factory :user do
    email     Faker::Internet.email
    password  Faker::Internet.password(8)
    nickname  'hoge'
    avatar    'hoge'

    factory :owner do
      admin true
    end
  end
end