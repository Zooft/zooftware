class Site < ActiveRecord::Base

  ## ASSOCIATIONS
  has_one :primary_domain, 
          :class_name=>"Domain", 
          :conditions=>['domains.is_primary=?', true]
  has_many :domains, :dependent=>:destroy
  has_many :menu_items, :dependent=>:destroy
  has_many :pages, :dependent=>:destroy
  has_many :blog_entries, :dependent=>:destroy
  has_many :events, :dependent=>:destroy
  has_many :faq_entries, :dependent=>:destroy

  ## VALIDATIONS
  validates :name, :lang_code, :presence=>true

  ## ANAF
  accepts_nested_attributes_for :domains, :allow_destroy=>true, :reject_if=>proc{|d| d['domain'].blank? }

  ## ACCESIBLE
  attr_accessible :name, :lang_code, :domains_attributes
end
