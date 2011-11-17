module SmartsHelper
  def coderay(text)
html  = CodeRay.scan("#{text}", :ruby).div()
#:line_numbers => :table)

#html1 =textilize html

#html1.html_safe
html.html_safe
  end
  
 def coderay2(text) 
txt = CodeFormatter.new(text)
puts txt
html = txt.to_html.html_safe

 end

end

