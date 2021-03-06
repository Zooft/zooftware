class MenuItem < ActiveRecord::Base
  
  ## SCOPES
  scope :ordered, order("#{MenuItem.quoted_table_name}.position ASC")

  ## ASSOCIATIONS
  belongs_to :page
  belongs_to :menu_group
  belongs_to :site

  ## VALIDATIONS
  validates :title, :menu_group_id, :presence=>true
  validates :title, :uniqueness=>{:scope=>:menu_group_id}
  validates :page_id, :presence=>true, :if=>proc{|mi| mi.url.blank? }
  validates :url, :presence=>true, :if=>proc{|mi| mi.page_id.blank? }
  validates :menu_group_id, :site_id, :presence=>true

  ## ACCESSIBLE
  attr_accessible :title, :page_id, :url


end
