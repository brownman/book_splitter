require 'spec_helper'

# No code writing is required for this test suite, just fill in the __ to make them all pass

# This suite was taken directly from https://github.com/edgecase/ruby_koans
# and converted to use with Rspec 

describe Regexp do
  def __
    'Fill in your answer here'
  end

  it 'has the right class' do
    /pattern/.class.should == Regexp
  end

  it 'can search a string for matching content' do
    "some matching content"[/matchi/].should == "matchi"
  end

  it 'returns nil if no match is found' do
    "some matching content"[/missing/].should == nil
  end

  it 'question mark indicates that the match is optional' do
    "abbcccddddeeeee"[/ab?/].should == 'ab'
    "abbcccddddeeeee"[/az?/].should == 'a'
    #find all strings:della and del : '/del?l?/'
  end

  it 'plus sign means one or more' do
    "abbcccddddeeeee"[/bc+/].should == 'bccc'
    #how to find all occurances of double-letter ?
    #macro: [abc letter]+
  end

  it '* means zero or more' do
    "abbcccddddeeeee"[/ab*/].should == 'abb' 
    "abbcccddddeeeee"[/az*/].should == 'a'

    "abbcccddddeeeee"[/z*/].should  == '' 
    #nil[/z*/].should  == nil

    # THINK ABOUT IT:
    #
    # When would * fail to match?
  end

  it 'the left most matches wins' do
    "abbccc az"[/az*/].should == 'a'
    #die young..
    #
    # THINK ABOUT IT:
    #
    # We say that the repetition operators above are "greedy."
    #
    # Why?
  end

  describe 'optional matching from a set []' do
    it 'square brackets allow for optional matching from a set' do
      regex = /[cbr]at/
      "cat"[regex].should == 'cat'
      "bat"[regex].should == 'bat'
      "rat"[regex].should == 'rat'
      "zat"[regex].should == nil


      #find all verbs ends with do
      "mangando"[/do/].should == "do"
    end

    it 'requires that at least one of the set matches' do

      regex = /[cbr]at/
      "at"[regex].should  == nil
    end

    it '\d should match any digit' do
      "the number is 42"[/[0123456789]+/].should == '42'
      "the number is 42"[/\d+/].should == '42'
    end

    it '- can be used to express ranges' do

      "the number is 42"[/[0-9]+/].should == "42"
      "the number is 42"[/[0-9]/].should == "4"
      "the number is 42"[/[a-z]+/].should == "the" 

      pending "how to make it get all the text and ws?"
      pending "how to make it get all the text but without ws?"
    end

    it 'can be negated with a ^ character' do
      "the number is 42"[/[^0-9]+/].should == 'the number is '
      #pending "mangarsi"[/[^ais]*/].should == 'mngr'
      pending "howto: from mangarsi to mngr?"
    end
  end

  describe 'special characters' do
    it '\s will catch white space' do
      " \nspace: \t\n"[/\s+/].should == " \n"
      pending 'how to remove all occurances of: /\n ?'
    end

    it '\w will catch a whole word' do
      # NOTE:  This is more like how a programmer might define a word.
      "variable_1 = 42"[/[a-zA-Z0-9]+/].should == 'variable'
      "variable_1 zebra = 42"[/\w+/].should == 'variable_1'
      #how to overwrite default of w to exlude symbole: _
    end

    it '. is a wild card character and will match anything besides a new line' do
      "abc\n123"[/a.+/].should == 'abc'

      "abc123"[/a.+/].should == 'abc123'

      pending "how to take everything but the newl ?"
    end

    it 'can be negated with the uppercase version' do
      "the number is 42"[/\D+/].should == 'the number is '
      "space : \t\n"[/\S*/].should == 'space'
      "variable_1 = ? 42"[/\W+/].should == ' = ? '
    end

    it '\A will anchor matches to the front of the string' do
      "startii end"[/\Astart/].should == 'start'
      "start end"[/\Aend/].should == nil
      "start\nend"[/\Astart/].should == 'start'

      "startii end"[/\A[start]+/].should == 'start'
    end

    it '\z will anchor matches to the end of the string' do
      "start end"[/end\z/].should == 'end'
      "start end"[/start\z/].should == nil
      "start\nend"[/end\z/].should == 'end'
    end

    it '^ (outside of square brackets) will anchor to the front of the line' do
      "num 43\n2 lines"[/^\d+/].should == '2'
    end

    it '$ anchors matches to the end of the line' do
      "2 lines\nnum 41"[/\d+$/].should =='41' 

      "chapter 9\n once upon atime"[/\d+$/].should =='9' 
    end

    it '\b anchors matches to a word boundary' do
      "bovine vines"[/\bvine./].should == 'vines'
    end
  end

  describe 'grouping with parens' do
    it 'groups contents with parens' do
      "ahahaha"[/(ha)+/].should == 'hahaha'
    end

    it 'will return a captured group by number (1-based indexing)' do
      "Gray, James"[/(\w+), (\w+)/, 1].should == 'Gray'
      "Gray, James"[/(\w+), (\w+)/, 2].should == 'James'
    end

    it 'generates captures that can be accessed with special variables' do
      "Name:  Gray, James"[/(\w+), (\w+)/].should == 'Gray, James' 
      $1.should == 'Gray' # the first capture
      $2.should == 'James' # the second capture
      pending 'how to do it with letters: mangarsi?'

    end

    it '| means or' do
      grays_regex = /(James|Dana|Summer) Gray/
      "James Gray"[grays_regex].should == 'James Gray'
      "Summer Gray"[grays_regex, 1].should == 'Summer'

      "Jim Gray"[grays_regex, 1].should == nil 
      "Jim Gray"[grays_regex, 2].should == nil 
      pending "how to do (zero or more) Gray" 
      # THINK ABOUT IT:
      #
      # Explain the difference between a character class ([...]) and alternation (|).

      # ------------------------------------------------------------------
    end
  end
  #functions: 
  describe 'other methods on string for matching' do
    it '#scan will find all matches' do
      "one two-three".scan(/\w+/).should == ['one', 'two', 'three']
      "nice12 a!".scan( /[\W\d]/ ).should == ["1", "2", " ", "!"]


    end

    it '#sub will find and replace the first match' do

      "one two-three".sub(/t\w*/, '2').should == 'one 2-three'
      "tone two-three"[/t\w*/].should == 'tone'

      pending "create html tags for a story to highlight : for example: verbs"
    end

    it '#gsub will find and replace all matches' do
      "one two-three".gsub(/t\w*/, 'number').should == 'one number-number' 

      "nice12 a!".gsub!( /[\W\d]/ , "").should == "nicea"

      # "one \n two\n -three".gsub(/\n\w*/, '~').should == 'one number-number' 
    end
    it 'start to end' do
      str = 'az vzbc'
      result = str[/^a[ zv]*bc$/]

      result.should == 'az vzbc'

    end
    it 'panctuation words panctuation' do
      res = /W[aeiou]+rd/.match("Wierd")
      res.to_s.should  == 'Wierd'


    end
    it 'rise exception' do
   lambda { eval "/(hay(st)ack/" }.should raise_error(SyntaxError)

    end
it 'non-capture group' do
    /(?:foo)(bar)/.match("foobar").to_a.should == ["foobar", "bar"]

end


  end
end

