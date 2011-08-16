class Site < ActiveRecord::Base

  ## ASSOCIATIONS
  has_one :primary_domain, 
          :class_name=>"Domain", 
          :conditions=>['domains.is_primary=?', true]
  has_many :domains, :dependent=>:destroy
  # has_many :menu_items, :dependent=>:destroy
  # has_many :pages, :dependent=>:destroy

  ## VALIDATIONS
  validates :name, :lang_code, :presence=>true

  ## ACCESIBLE
  attr_accessible :name, :lang_code
end
