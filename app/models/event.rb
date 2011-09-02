class Event < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site
  
  ## PAPERCLIP
  has_attached_file :image, :styles=>{:show=>"610x900>"}
  
  ## VALIDATIONS
  validates :name, :event_date, :presence=>true

  ## ACCESSIBLE
  attr_accessible :name, :event_date, :description, :image
end
