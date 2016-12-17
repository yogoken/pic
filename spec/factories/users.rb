FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password(8) }
    nickname  'hoge'
    avatar    'test.png'

    factory :owner do
      admin 1
    end
  end
end