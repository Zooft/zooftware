class PromotedGroup < ActiveRecord::Base

  ## ASSOCIATIONS

  ## VALIDATIONS
  validates :name, :presence=>true
  validates :identifier, :presence=>true, :uniqueness=>true
  validates :image_size, :presence=>true, :format=>{:with=>/^\d{1,3}x\d{1,3}[\>\#]$/}

  ## ACCESSIBLE
  attr_accessible :name, :identifier, :image_size
end
