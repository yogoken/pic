FactoryGirl.define do
  factory :comment do
    user
    letter
    content 'aaa'

    trait :with_likes do
      transient do
        likes_count 1
      end
      after(:create) do |comment, evaluator|
        comment.likes << create_list(:like, evaluator.likes_count)
      end
    end
  end
end