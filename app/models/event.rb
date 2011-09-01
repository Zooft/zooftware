class Event < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site

  ## VALIDATIONS
  validates :name, :event_date, :presence=>true

  ## ACCESSIBLE
  attr_accessible :name, :event_date, :description
end
