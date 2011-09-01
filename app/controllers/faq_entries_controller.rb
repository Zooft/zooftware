class FaqEntriesController < ApplicationController
  def index
    @faq_entries = FaqEntry.ordered.all
  end

end
