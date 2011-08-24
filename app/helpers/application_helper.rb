module ApplicationHelper
  def main_navigation(menu)
    menu.item "Home", admin_root_path, :active=> (request.path =~ /#{admin_root_path}/)
  end
end
