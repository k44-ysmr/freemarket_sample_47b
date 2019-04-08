class Image < ApplicationRecord
  belongs_to :item, inverse_of: :images

  mount_uploader :name, ImageUploader

  validates :name, presence: true
  validates :item, presence: true
end
