class MenuGroup < ActiveRecord::Base

  ## ASSOCIATIONS
  # has_many :menu_items, :dependent=>:destroy
  

  ## VALIDATIONS
  validates :name, :identifier, :presence=>true
  validates :identifier, :uniqueness=>true

  ## ACCESSIBLE
  attr_accessible :name, :identifier, :is_default

  ## BEFORE AND AFTER ACTIONS
  before_save :mark_as_default
  after_save :take_care_of_default


  def mark_as_default
    if MenuGroup.where('is_default=?', true).all.count == 0
      self.is_default = true
    end
  end
  
  def take_care_of_default
    if self.is_default?
      MenuGroup.update_all(['is_default=? ', false], ['id!=?', self.id])
    end
  end

end
