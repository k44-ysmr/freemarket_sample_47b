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

## items TB

| Column | Type | Options |
|:-----------|------------:|:------------:|
| name | string	| null: false, index: true |
| price	| integer |	null: false
| description	| text | null: false |
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
