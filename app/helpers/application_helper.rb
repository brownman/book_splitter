

module ApplicationHelper
    def textilize(text)
    CodeFormatter.new(text).to_html.html_safe unless text.blank?
  end
  # Return a title on a per-page basis.
  def title
    base_title = "Book Splitter"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
