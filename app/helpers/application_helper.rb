module ApplicationHelper
  def main_navigation(menu)
    menu.item "Home", admin_root_path, :active=> (request.path =~ /^#{admin_root_path}$/)
    if selected_site
      menu.item "Menu", admin_menu_groups_path, :active=> (request.path =~ /^#{admin_menu_groups_path}/)
    end
  end

  def sidebar
    if @sidebar_path
      render :partial=>@sidebar_path
    end
  end
end
