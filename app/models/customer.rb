class Customer < ActiveRecord::Base
  has_many :consultations
  has_many :attachments
  belongs_to :miasmic_type

  validates_presence_of :name
  validates_length_of :areacode , :maximum => 5

  mount_uploader :customer_image, ImageUploader
end
