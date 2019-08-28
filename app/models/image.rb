class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :course
  has_many :images
end
