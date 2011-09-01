class BlogEntry < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site

  ## VALIDATIONS
  validates :title, :presence=>true

  ## ACCESSIBLE
  attr_accessible :title, :lead, :content
  
end
