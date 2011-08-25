class Admin::PagesController < Admin::ApplicationController
  inherit_resources
  protected
    def begin_of_association_chain
      selected_site
    end
end
