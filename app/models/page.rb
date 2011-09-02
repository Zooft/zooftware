class Page < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site

  ## PAPERCLIP
  has_attached_file :image, :styles=>{:show=>"610x900>"}
  
  ## VALIDATIONS
  validates :title, :presence=>true
  validates :site_id, :presence=>true

  ## ACCESSIBLE
  attr_accessible :title, :content, :image


end
