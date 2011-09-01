class Admin::MenuItemsController < Admin::ApplicationController
  before_filter :find_menu_group
  inherit_resources
  belongs_to :menu_group

  def create
    @menu_item = @menu_group.menu_items.new(params[:menu_item])
    @menu_item.site = selected_site
    @menu_item.save
    create!
  end

  protected
    def collection
      @menu_items = @menu_group.menu_items.where(:site_id=>selected_site).all
    end
    
    def resource
      @menu_item = @menu_group.menu_items.where(:site_id=>selected_site).find(params[:id])
    end
   
    def find_menu_group
      @menu_group = MenuGroup.find(params[:menu_group_id])
    end

end
