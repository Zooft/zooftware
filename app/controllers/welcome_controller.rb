class WelcomeController < ApplicationController
  
  def index
    @events = current_site.events.order('event_date DESC').limit(5)
    @promoted = {}
    @promoted[:top_group] = PromotedGroup.find_by_identifier('top_group')
    @promoted[:bottom_group] = PromotedGroup.find_by_identifier('bottom_group')
  end

end
