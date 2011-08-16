class Domain < ActiveRecord::Base

  ## ASSOCIATIONS
  belongs_to :site

  ## VALIDATIONS
  validates :site_id, :presence=>true
  validates :domain, :presence=>true, :uniqueness=>true

  ## ACCESSIBLE
  attr_accessible :domain, :site_id, :is_primary

  ## BEFORE AND AFTER ACTIONS
  before_save :mark_as_primary
  after_save :take_care_of_primary

  def to_s
    self.domain
  end
  
  def mark_as_primary
    if Domain.where('site_id=? and is_primary=?', self.site_id, true).all.count == 0
      self.is_primary = true
    end
  end
  
  def take_care_of_primary
    if self.is_primary?
      Domain.update_all(['is_primary=? ', false], ['id!=? and site_id=?', self.id, self.site_id])
    end
  end

end
