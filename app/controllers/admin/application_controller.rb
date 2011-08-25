class Admin::ApplicationController < ApplicationController
  layout "activo"
  before_filter :authenticate_user!
  before_filter :ensure_admin
  before_filter :selected_site
  skip_before_filter :get_current_site
  helper_method :selected_site

  def selected_site
    @selected_site ||= Site.find(session[:selected_site]) unless session[:selected_site].blank?
    @selected_site || nil
  end

  protected
    def ensure_admin
      redirect_to root_url unless current_user.is_admin?
    end

end
