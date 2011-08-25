class Admin::MenuItemsController < Admin::ApplicationController
  inherit_resources
  belongs_to :menu_group

end
