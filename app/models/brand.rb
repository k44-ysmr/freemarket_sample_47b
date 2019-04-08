class Brand < ApplicationRecord
  belongs_to :brand_group
  has_many :items
end
