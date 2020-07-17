# README
## Description(まとめ)
メルカリのサイトをクローンしたポートフォリオです。

## Features（機能一覧）
- ユーザー新規登録・ログイン機能・SNS連携(omnioauth gem)
- 商品出品・購入・編集
- カテゴリー・ブランド機能
- クレジットカード登録・利用購入(payjp)
- マイページ機能・編集
- 商品検索機能(Ransack gem)

## Requirement(技術一覧)
- Ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin18]
- Rails 5.2.2.1
- Haml/Scss/Javascript/Jquery
- AWS/Unicorn/Nginx/Mysql/Capistrano
- Github/Trello/Slack

## Development Period（開発期間）
- 2019/03/27-04/19 team

# Database
## users TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| nickname | string | null: false |
| email | string | null: false, unique: true |
| last_name | string | -- |
| first_name | string | -- |
| last_name_kana | string | -- |
| first_name_kana | string | -- |
| city | string | -- |
| block | string | -- |
| building | string | -- |
| birth_year | integer | -- |
| birth_month | integer | -- |
| birth_day | integer | -- |
| phone_number | string | -- |
| zipcode | string | -- |
| prefecture | integer | -- |

- has_many :items
- has_many :trading_partners
- has_many :sns_credentials
- has_many :credit_cards

## sns_credentials TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| uid | string | null: false, unique: true |
| provider | string | null: false |
| token | text | -- |
| user_id | references | null: false, index: true, foreign_key: true |

- belongs_to :user

## credit_cards TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| card_id | string | -- |
| customer_id | string | -- |
| user_id | references | null: false, index: true, foreign_key: true |

- belongs_to :user

## items TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string	| null: false, index: true |
| description	| string | null: false |
| price	| integer |	null: false
| condition	| integer |	null: false |
| shipping_fee | integer | null: false |
| prefecture_id |	integer |	null: false |
| days_before_shipping | integer | null: false |
| shipping_method | integer	| null: false |
| trade_status | integer | null: false |
| brand_id | references | index: true, foreign_key: true |
| category_id | references | null: false, index: true, foreign_key: true |
| user_id | references | null: false, index: true, foreign_key: true |
| size_id | references | null: false, index: true, foreign_key: true |

- belongs_to :category
- belongs_to :user
- has_many :images
- has_one :order

## brands TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |
| brand_group_id | references | index: true, foreign_key: true |

- belongs_to :brand_group

## brand_groups TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |

- has_many :brands

## categories TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |
| parent_id | integer | -- |

- has_many :items

## sizes TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |

## size_chart TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |
| category_id | references | null: false, index: true, foreign_key: true |
| size_id | references | null: false, index: true, foreign_key: true |

## images TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false |
| item_id | references | null: false, index: true, foreign_key: true |

- belongs_to :item

## trading_partners TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| buyer_id | references | null: false, index: true, foreign_key: { to_table: :users } |
| seller_id | references | null: false, index: true, foreign_key: { to_table: :users } |

- belongs_to :buyer, class_name: "User"
- belongs_to :seller, class_name: "User"
- has_many :orders

## orders TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| status | integer | null: false |
| item_id | references | null: false, index: true, foreign_key: true |
| trading_partner_id | references | null: false, index: true, foreign_key: true |

- belongs_to :item
- belongs_to :trading_partner

