require 'spec_helper'

describe 'quiz1' do
  before :all do
    @str1 = "ab1cd123a bcd!" 
  end

  describe '1) Discard any non A to Z characters' do 
    #1. 
    #Discard any non A to Z characters, 
    #and uppercase all remaining letters.
    #Split the message into five character groups, 
    #using Xs to pad the last group, 
    #if needed. If we begin with the message "Code in Ruby, live longer!", for example, we would now have:


    it 'Discard Number' do 
      discard_non_character( @str1 )
      @str1.should == "abcdabcd"
    end
    it 'uppercase a to z' do
      uppercase_remaining(@str1)
      @str1.should == "ABCDABCD"
    end
    it 'split text to group of 5 letters' do

      @arr1 =   split_to_groups(@str1)
      @arr1.should == ["ABCDA","BCDXX"]
    end
    it 'chain methods' do
      step1("Code in Ruby, live longer!").should == "CODEI NRUBY LIVEL ONGER"
    end
  end

  #DWJXH YRFDG TMSHP UURXJ
  #3. Convert the message from step 1 into numbers, A = 1, B = 2, etc:
  #3 15 4 5 9  14 18 21 2 25  12 9 22 5 12  15 14 7 5 18
  describe '3) decode: text to number' do
    it 'decode char to ascii value' do
      to_num('A').should == 1
    end
    it 'decode a string:each char to a value when A is 1' do

      str = "DWJXH YRFDG TMSHP UURXJ"
      (      encode_ch_to_i str).should == "4 23 10 24 8  25 18 6 4 7  20 13 19 8 16  21 21 18 24 10"





    end


  end


end

def step1 str
  arr = split_to_groups(uppercase_remaining(discard_non_character(str))) 
  arr.join " "

end
def  discard_non_character str
  str.gsub!( /[\W\d]/ , "")
end
def  uppercase_remaining str
  str.upcase!
end
def split_to_groups  str
  str << "X"*4
  str.scan(/...../) 
end

def encode_ch_to_i str
  arr = []
  str.each_char do |ch|
    if ch == ' ' 
      arr.push ' ' 
    else
      num = to_num(ch)
      arr.push  num.to_s
    end
  end

  str2  = arr.join ' ' 
  str2.gsub!(/\s\s/, ' ') #replace double space with space

  str2
end

def to_num ch
  ch.ord.to_i - 64 
end

