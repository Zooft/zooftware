class Admin::SitesController < Admin::ApplicationController
  inherit_resources

  def set_primary_domain
    @site = Site.find(params[:id])
    @domain = @site.domains.find(params[:domain_id])
    @domain.is_primary = true
    @domain.save!
    redirect_to :back
  end
end
