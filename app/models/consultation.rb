class Consultation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :treatment

  validates_presence_of :consultation_date
  validates_presence_of :short_description


  netzke_attribute :limited_description

  def limited_description
    # remove all html tags and limit to 200 characters
    limited_description = description.gsub(/<.*?>/,' ')
  end

end
