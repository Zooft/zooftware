class Room < ActiveRecord::Base

  ## ASSOCIATIONS
  has_many :resources
  
  ## VALIDATIONS
  validates :name, :presence=>true, :uniqueness=>true

  ## ACCESSIBLE
  attr_accessible :name, :description


end
