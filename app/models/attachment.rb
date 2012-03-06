class Attachment < ActiveRecord::Base
  validates_presence_of :name, :document

  mount_uploader :document, FileUploader
end
