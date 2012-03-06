class ImageEntry < ActiveRecord::Base
  validates_presence_of :image, :imagedate, :description

  belongs_to :image_gallery

  #TODO ImageUploader verwenden?
  mount_uploader :image, FileUploader
end
