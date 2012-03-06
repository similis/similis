class ImageGallery < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :customer_id

  belongs_to :customer
  has_many :image_entries
end
