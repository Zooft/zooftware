module PagesHelper
  def get_page_link(identifier, options={})
    p = current_site.pages.find_by_identifier(identifier)
    if p
      link_to options[:title] || p.title, page_path(p), options
    end
  end
end
