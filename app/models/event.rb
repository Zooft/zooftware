class Event < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site
  
  ## PAPERCLIP
  has_attached_file :image, :styles=>{:show=>"900x310>"}
  
  ## VALIDATIONS
  validates :name, :event_date, :presence=>true

  ## ACCESSIBLE
  attr_accessible :name, :event_date, :description
end
