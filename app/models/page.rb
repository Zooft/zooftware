class Page < ActiveRecord::Base
  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :title, :use => :slugged

  ## ASSOCIATIONS
  belongs_to :site

  ## PAPERCLIP
  has_attached_file :image, :styles=>{:show=>"610x900>"}
  
  
  ## VALIDATIONS
  validates :title, :presence=>true
  validates :site_id, :presence=>true
  validates :identifier, :uniqueness=>{:scope=>:site_id}, :if=>:identifier?

  ## ACCESSIBLE
  attr_accessible :title, :content, :image, :identifier


end
