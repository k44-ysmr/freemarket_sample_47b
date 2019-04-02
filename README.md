# README

# Ruby version
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin18]

# Rails version
Rails 5.2.2.1

# Development Period
2019/03/27-04/20

# Database
## users TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password | string | -- |

has_many :items
has_many :trading_partners

## items TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string	| null: false, index: true |
| description	| string | null: false |
| price	| integer |	null: false
| condition	| integer |	null: false |
| shipping_fee | integer | null: false |
| shipping_from |	integer |	null: false |
| days_before_shipping | integer | null: false |
| shipping_method | integer	| null: false |
| trade_status | integer | null: false |
| brand_id | references | index: true, foreign_key: true |
| category_id | references | null: false, index: true, foreign_key: true |
| user_id | references | null: false, index: true, foreign_key: true |
| size_id | references | null: false, index: true, foreign_key: true |

belongs_to :category
belongs_to :user
has_many :images
has_one :order

## brands TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |
| brand_group_id | references | index: true, foreign_key: true |

belongs_to :brand_group

## brand_groups TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |

has_many :brands

## categories TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string | null: false, unique: true |

has_many :items

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

belongs_to :item

## trading_partners TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| buyer_id | references | null: false, index: true, foreign_key: { to_table: :users } |
| seller_id | references | null: false, index: true, foreign_key: { to_table: :users } |

belongs_to :buyer, class_name: "User"
belongs_to :seller, class_name: "User"
has_many :orders

## orders TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| status | integer | null: false |
| item_id | references | null: false, index: true, foreign_key: true |
| trading_partner_id | references | null: false, index: true, foreign_key: true |

belongs_to :item
belongs_to :trading_partner

