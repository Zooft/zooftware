class PromotedItem < ActiveRecord::Base

  ## SCOPES
  scope :ordered, order('position ASC')

  ## ASSOCIATIONS
  belongs_to :promoted_group
  belongs_to :site
  belongs_to :linkable, :polymorphic=>true

  ## PAPERCLIP
  has_attached_file :image, :styles=>{:resized=>lambda{ |pi| puts "pi: #{pi.attributes}"; PromotedGroup.find(pi.promoted_group_id).image_size } }
  
  ## VALIDATIONS
  validates :title, :promoted_group_id, :site_id, :presence=>true


  ## ACCESSIBLE
  attr_accessible :title, :content, :position, :image, :body, :promoted_group_id, :linkable_type, :linkable_id

  ## HACKS
  alias_method :attributes_without_attachment=, :attributes=

  def attributes=(new_attributes, guard_protected_attributes = true)
    i = new_attributes["image"] || new_attributes[:image]
    @content_type = i.content_type if i
    send(:attributes_without_attachment=, new_attributes.reject{|key, val| key.to_s == "image"}, guard_protected_attributes)
    self.image = i if i
  end
  
  before_validation(:on => :update){ |i| i.image = i.image.to_file(:original) if i.changes['promoted_group_id'] }
end

