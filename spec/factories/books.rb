FactoryGirl.define do
  factory :book do
    user
    title  { Faker::Name.name }
    image  { Faker::Avatar.image }
    author { Faker::Name.name }
    manufacturer { Faker::Name.name }
    url    'http://qiita.com/yogoken/private/cb28b8cac6672a4c158c'
  end
end