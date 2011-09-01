class BlogEntry < ActiveRecord::Base
  paginates_per 10

  ## ASSOCIATIONS
  belongs_to :site

  ## PAPERCLIP
  has_attached_file :image, :styles=>{:show=>"900x310>", :list=>"180x135#"}
  
  ## VALIDATIONS
  validates :title, :presence=>true

  ## ACCESSIBLE
  attr_accessible :title, :lead, :content
  
end
