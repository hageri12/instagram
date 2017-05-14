class Blog < ApplicationRecord
  validates :content, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
