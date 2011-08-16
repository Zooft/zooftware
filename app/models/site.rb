class Site < ActiveRecord::Base

  ## ASSOCIATIONS
  has_many :domains, :dependent=>:destroy
  # has_many :menu_items, :dependent=>:destroy
  # has_many :pages, :dependent=>:destroy

  ## VALIDATIONS
  validates :name, :lang_code, :presence=>true

  ## ACCESIBLE
  attr_accessible :name, :lang_code
end
