require 'prawn'

class StyleParser
  class << self
    def process str
   str.split 
    end
  end

end
class Prawn::Document
  def parse_inline_styles(text)
    text.split
  end
end
