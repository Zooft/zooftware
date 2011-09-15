class EventsController < ApplicationController
  def index
  end

  def show
    @event = current_site.events.find(params[:id])
  end

end
