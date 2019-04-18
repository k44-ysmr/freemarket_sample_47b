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

  def self.set_index(id)
    Item.where(id).order("created_at DESC")
  end
end
