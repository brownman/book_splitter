module DraftsHelper
  def show_regexp_result draft
    str_all = '<menu>'
    draft.hunter_result.each do |res|
            str_all << "<li>#{res}</li>"
    end
    
    str_all<< '</menu>'
    str_all.html_safe
  end
  
  def rich_text draft 

str_all = '<text>' +  draft.replace_string + '</text>'

puts str_all
    str_all.html_safe

  end
end
