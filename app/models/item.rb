class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :delete_all
  has_one :order
end
