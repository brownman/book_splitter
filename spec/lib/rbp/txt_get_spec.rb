require 'spec_helper'

describe 'TxtGet' do

  it 'find occurances of some string' do 
    string = "once upon a time" 
    string[/upon/].should == 'upon'
    
res =     string.match /upon/
res.to_s.should == "upon"

   res = "The alphabet starts with abc" =~ /abc/
   res.should == 25 
#search for (3digits):spaces:3digits-4digits
string = "My phone number is (123) 555-1234."
phone_re = /\((\d{3})\)\s+(\d{3})-(\d{4})/
res = phone_re.match(string)
res.to_a.should == ["(123) 555-1234", "123", "555", "1234"]

#search form many matches: ()
res = /([A-Za-z]+),[A-Za-z]+,(Mrs?\.)/.match("Peel,Emma,Mrs.,talented amateur")
res.to_a.should == ["Peel,Emma,Mrs.", "Peel", "Mrs."]
res =   /((a)((b)c))/.match("abc")
res.to_a.should == ["abc", "abc", "a", "bc", "b"]

#how to search a text for a word and return the surrounding line?
  end
end

