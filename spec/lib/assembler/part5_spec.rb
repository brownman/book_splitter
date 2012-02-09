require 'spec_helper'


describe 'securitytube - asm - part 5: data types' do
  describe 'byte , ascii asciiz=null ,  int=int32 short=int16 , float=.1 double=.2' do

  end
  describe 'data types defined at:' do
    it 'compile/run time' do
      'run-time: declare on segment:  .bss=common|local memory'
      'compile-time: declare on segment: .data'
    end
  end

  describe 'ii' do
    ':break on label: _start+1'
    ':info variables: 
ByteLocation: .byte 10 #default assignment: decimel --> display as decimel , unit_size:byte
Int31: .int 2# display format:decimel , unit_size: word
Int16: .short 3 #display format: decimel, unit_size: half-word

Float: .float 10.23 #umits:1 , format:decimel, unit_size: word
Double: .double 10.23 #units: 1, format:float, unit_size: word
Integer_array: .int 10,20,30,40,50 #units:5 |unit_size: word | display format: decimel
'
    it 'examine memory locations:' do

      'string of 12 characters: -> x/12cb' #will print:12 units of.. unit size:1 byte, display as: char
      'int ' #will print:12 units of.. unit size:1 byte, display as: char
    end
  end


end

