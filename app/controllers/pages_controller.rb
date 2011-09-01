class PagesController < ApplicationController
  def show
    @page = current_site.pages.find(params[:id])
  end

end
