class FaqEntry < ActiveRecord::Base

  ## SCOPES
  scope :ordered, order('position ASC')

  ## ASSOCIATIONS
  belongs_to :site

  ## VALIDATIONS
  validates :question, :answer, :presence=>true

  ## ACCESSIBLE
  attr_accessible :question, :answer
end
