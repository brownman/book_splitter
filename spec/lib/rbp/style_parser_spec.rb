#http://www.humbug.in/docs/ruby-best-practices/ch01.html
require 'spec_helper'
require 'prawn'
describe StyleParser do
  def assert_equal a , b
    a.should == b
  end
  #def self.must str,block
  #it  str, block
  #end
  it 'true' do  
    assert_equal 1,1
  end

  def style_tag?(text)
    !!(text =~ %r{(</?[ib]>)})
  end
  def equal_str? str1  
    assert_equal str1.to_sym,style_tag?(str1).to_sym
  end

  it 'it has tags ?' do

    str = "sdfs"
    #style_tag?( str) .should == false
    #style_tag?"sdfs</s>".should == false

    equal_str? str

    str = "sdfs</z>"
    equal_str? str

  end
  it "simply return the string if styles are not found" do
    @pdf = Prawn::Document.new
    assert_equal "Hello World1", @pdf.parse_inline_styles("Hello World1")
  end
  it 'check' do 
    #assert_equal 1,2
  end
  it "parse italic tags" do
    @pdf = Prawn::Document.new
    assert_equal ["Hello ", "<i>", "Fine", "</i>", " World1"],
      @pdf.parse_inline_styles("Hello <i>Fine</i> World")
  end
  pending 'result' do
    StyleParser.process("Some <b>bold</b> and <i>italic</i> text").should ==       ["Some ", "<b>", "bold", "</b>", " and ", "<i>", "italic", "</i>", " text"]
  end
end


