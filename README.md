# 仕様書
## 1, サービス名
TECH::SHARE (http://52.199.29.59/)

[![https://gyazo.com/8e42d22deb4aab7d45a66bc37cee7820](https://i.gyazo.com/8e42d22deb4aab7d45a66bc37cee7820.png)](https://gyazo.com/8e42d22deb4aab7d45a66bc37cee7820)
#### 1-1 コンセプト
- TECH::CAMPのメンター200名が日々学んだことや参考にしているサイトを投稿し、他のメンターが何日々見ているのかを視覚化し、意見場を設ける

#### 1-2 ターゲットユーザー
- TECH::CAMPメンター

#### 1-3 解決する問題
- 技術力向上と、参考記事のシェアによるコミュニケーションを双方向化

#### 1-5 見本サイト
- https://newspicks.com/


## 2, 見積り工数
- 期間

| 実装箇所 | 期間 |
|---|---|
| `フロントエンド` |5日|
| `バックエンド` |14日|
| `サーバーデプロイ` |4日|
| `フロントエンドとバックエンドのつなぎ` |4日|
| `予備日` |4日|

合計：31日
※別途AWSサーバー代

##3, UI設計
◯管理画面UI(1枚)

◯ユーザー側UI(3枚)
- news詳細
- news登録ページ

■バックエンド機能
機能部分
ユーザー関連(10日)
- 登録, 編集, 削除
- 新規登録・ログイン機能(1日)
- news登録機能(3日)
- 管理画面(3日)

## テーブル設計

### Users

|column|説明|type|default|null|備考|
|---|---|---|---|---|---|
| `nickname` | ニックネーム | string |  | false | |
| `avatar` | アバター | string | | false | Carrierwaveを利用|

### Letters
| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `title` | 記事のタイトル | string | | false | |
| `image` | 記事のイメージ | string | | false | |
| `url` | 記事のURL | string | | false | |
| `site_name` | サイトの名前 | string | | false | |
| `comments_count` | コメントの数 | integer | | false | |


- 関連
  - `has_many :comments`


### Comments

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `content` | コメントのコンテンツ | string | | false | |
| `user_id` | 紐づくUserのid | references | | false | |
| `letter_id` | 紐づくLetterのid | references | | false | |
| `likes_count` | 紐づくArticleのid | references | | false | |

- 関連
  - `belongs_to :user`
  - `belongs_to :letter, counter_cache: true`
  - `has_many :likes, dependent: :destroy`


### Likes

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `user_id` | 紐づくUserのid | references | | false | |
| `comment_id` | 紐づくCommentのid | references | | false | |

- 関連
  - `belongs_to :user`
  - `belongs_to :comment`
