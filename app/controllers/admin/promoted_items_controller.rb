class Admin::PromotedItemsController < Admin::ApplicationController
  before_filter :find_promoted_group
  inherit_resources
  belongs_to :promoted_group

  def create
    logger.info "create !!!!!!!!!!!"
    params[:promoted_item] ||= {}
    params[:promoted_item][:promoted_group_id] = @promoted_group.id
    @promoted_item = PromotedItem.new(params[:promoted_item])
    # @promoted_item.promoted_group_id = @promoted_group.id
    @promoted_item.site = selected_site
    @promoted_item.save
    create!
  end
  
  protected
    def collection
      @promoted_items = @promoted_group.promoted_items.where(:site_id=>selected_site).all
    end
    
    def resource
      @promoted_item = @promoted_group.promoted_items.where(:site_id=>selected_site).find(params[:id])
    end
   
    def find_promoted_group
      @promoted_group = PromotedGroup.find(params[:promoted_group_id])
    end
end
