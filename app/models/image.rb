class Image < ApplicationRecord
  belongs_to :item, optional: true, inverse_of: :images

  mount_uploader :name, ImageUploader


  validates :name, presence: true
  validates :item, presence: true
end
