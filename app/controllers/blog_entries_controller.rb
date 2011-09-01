class BlogEntriesController < ApplicationController
  def index
    @blog_entries = BlogEntry.order('created_at DESC').page params[:page]
  end

  def show
    @blog_entry = BlogEntry.find(params[:id])
  end

end
