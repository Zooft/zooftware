class Admin::DashboardController < Admin::ApplicationController

  def index
    @sidebar_path = '/admin/dashboard/sidebar'
  end

  def set_current_site
    s = Site.find(params[:id])
    session[:selected_site] = s.id
    redirect_to admin_root_url
  end

end
