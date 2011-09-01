module ApplicationHelper
  def main_navigation(menu)
    menu.item "Home", admin_root_path, :active=> (request.path =~ /^#{admin_root_path}$/)
    if selected_site
      menu.item "Menu", admin_menu_groups_path, :active=> (request.path =~ /^#{admin_menu_groups_path}/)
      menu.item "Promoted groups", admin_promoted_groups_path, :active=> (request.path =~ /^#{admin_promoted_groups_path}/)
      menu.item "Pages", admin_pages_path, :active=> (request.path =~ /^#{admin_pages_path}/)
      menu.item "Events", admin_events_path, :active=> (request.path =~ /^#{admin_events_path}/)
      menu.item "Blog entries", admin_blog_entries_path, :active=> (request.path =~ /^#{admin_blog_entries_path}/)
      menu.item "FAQ entries", admin_faq_entries_path, :active=> (request.path =~ /^#{admin_faq_entries_path}/)

    end
  end

  def sidebar
    if @sidebar_path
      render :partial=>@sidebar_path
    end
  end

  def menu_item_path(mi)
    unless mi.page_id.blank?
      "/p/#{mi.page_id}"
    else
      mi.url
    end
  end

  def get_menu_items(menu)
    menu[:footer_group].menu_items.where(:site_id=>current_site.id).ordered.all
  end
end
