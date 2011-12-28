require 'spec_helper'
#1. 
#Discard any non A to Z characters, 
#and uppercase all remaining letters.
#Split the message into five character groups, 
#using Xs to pad the last group, 
#if needed. If we begin with the message "Code in Ruby, live longer!", for example, we would now have:


describe 'quiz1' do

  describe 'Discard any non A to Z characters' do 
    it 'Discard Number' do 
  discard_number( "ab1cd123abcd"  ).should == "abcdabcd"
    end
    it 'uppercase a to z' do
   
  end
  end

end
def  discard_number str

      str.gsub(/\d*/, '') 
end

