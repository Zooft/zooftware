class Admin::ApplicationController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :ensure_admin

  protected
    def ensure_admin
      redirect_to logout_url unless current_user.is_admin?
    end

end
