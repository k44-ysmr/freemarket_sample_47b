class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to :user
  belongs_to :size, optional: true

  has_many :images, dependent: :delete_all, inverse_of: :item
  accepts_nested_attributes_for :images

  has_one :order
  # accepts_nested_attributes_for :oders, update_only: true

enum condition: {"新品、未使用":1, "未使用に近い":2, "目立った傷汚れなし":3, "やや傷や汚れあり":4}

enum shipping_fee: {"送料込み(出品者負担)":1, "着払い(購入者負担)":2}

enum shipping_method: {"未定":1, "らくらくメルカリ便":2, "クロネコヤマト":3, "ゆうパック":4}

enum days_before_shipping: {"1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3}

end
