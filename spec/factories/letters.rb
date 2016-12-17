FactoryGirl.define do
  factory :letter do
    title { Faker::Name.name }
    image { Faker::Avatar.image }
    url   'http://www.newsweekjapan.jp/stories/world/2016/12/post-6558.php'
    site_name { Faker::Name.name }

    # -------------------------------------------------------------------------------
    # traitとは
    # traitを利用することで属性定義をわかりやすくでき、グループ化することも可能になる
    # ignoreとtransientはほぼ同じで、DBの属性とは関係ない属性を定義する
    # letter = 作成されたletterインスタンス自身
    # evaluator = transient内の属性を含むファクトリのすべての属性を保持
    # create_listの第2引数は、作成する関連を持ったレコードの数を指定する

    # 使い方
    # create(:letter).comments_length => 0
    # create(:letter, :with_comments).comments_length => 5
    # create(:letter, :with_comments, comments_length: 10).comments_length => 10
    # -------------------------------------------------------------------------------

    trait :with_comments do
      transient do
        comments_count 5
      end
      after(:create) do |letter, evaluator|
        letter.comments << create_list(:comment, evaluator.comments_count)
      end
    end

    trait :with_storages do
      transient do
        storages_count 5
      end
      after(:create) do |letter, evaluator|
        letter.storages << create_list(:storage, evaluator.storages_count)
      end
    end
  end
end