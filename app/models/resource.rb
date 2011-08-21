class Resource < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :room

  ## VALIDATIONS
  validates :name, :presence=>true, :uniqueness=>{:scope=>:room_id}
  validates :quantity, :presence=>true, :numericality=>{:greater_than_or_equal_to=>0}

  ## ACCESSIBLE
  attr_accessible :name, :quantity, :description, :room_id
end
