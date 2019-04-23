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

  enum condition: { excellent: 1, good: 2, fair: 3, bad: 4}

  enum shipping_fee: { shipping_included: 1, shippinng_separately: 2}

  enum shipping_method: { undecided: 1, mercari: 2, kuroneko: 3, yu_pack: 4}

  enum days_before_shipping: { two_days: 1, four_days: 2, seven_days: 3}

  validates :name,
    presence: true,
    length: { maximum: 40 }
  validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は300以上9,999,999以内で入力してください" }
  validates :description,
    presence: true,
    length: { maximum: 1000 }
  validates :condition,
    presence: { message: "選択して下さい" }
  validates :shipping_fee,
    presence: { message: "選択して下さい" }
  validates :prefecture_id,
    presence: { message: "選択して下さい" }
  validates :days_before_shipping,
    presence: { message: "選択して下さい" }
  validates :shipping_method,
    presence: { message: "選択して下さい" }
  validates :trade_status,
    presence: true
  validates :brand,
    length: { maximum: 40 }
  validates :category_id,
    numericality: { greater_than: 0, message: "選択して下さい" }
  validates :user_id,
    presence: true
  validates :size_id,
    numericality: { greater_than: 0, message: "選択して下さい" }

  def self.set_index(id)
    Item.where(id).limit(4).order("created_at DESC")
  end
end
