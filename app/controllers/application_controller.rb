class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_current_site
  helper_method :current_site
  before_filter :get_menu_groups

  def current_site
    @current_domain ||= Domain.find_by_domain(request.host)
    @current_domain ||= Domain.first
    return redirect_to("/admin/") if @current_domain.blank?
    @current_site ||= nil
    unless @current_domain.blank?
      if @current_site.blank?
        @current_site = @current_domain.site
        logger.info "Locale set to: #{@current_site.lang_code}"
        I18n.locale = @current_site.lang_code
      end
      if not @current_domain.is_primary? or @current_domain.domain != request.host
        logger.info "Redirecting to: #{@current_domain.site.primary_domain.domain}#{request.fullpath}"
        u = URI.parse(request.url)
        u.host = @current_domain.site.primary_domain.domain 
        return redirect_to(u.to_s)
      end
    end
    @current_site
  end
  protected :current_site
  
  def get_current_site
    current_site
  end
  private :get_current_site

  def get_menu_groups
    @menu = {}
    @menu[:top_group] = MenuGroup.find_by_identifier('top_group')
    @menu[:footer_group] = MenuGroup.find_by_identifier('footer_group')
  end
end
