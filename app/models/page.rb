class Page < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site

  ## VALIDATIONS
  validates :title, :presence=>true
  validates :site_id, :presence=>true
  
  ## ACCESSIBLE
  attr_accessible :title, :content


end
