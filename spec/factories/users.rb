FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password(8) }
    nickname  { Faker::Internet.user_name }
    avatar    'test.png'

    factory :owner do
      admin 1
    end
  end
end