class Admin::BlogEntriesController < Admin::ApplicationController
  inherit_resources

  private
    def begin_of_association_chain
      selected_site
    end
end
