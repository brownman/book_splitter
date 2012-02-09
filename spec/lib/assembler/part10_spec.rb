require 'spec_helper'


describe 'securitytube - asm - part 10: functions' do
  it 'define:' do
    'type labelF, call labelF, labelF..ret'
    'use is with- :call'
  end
  it 'return value from a function:' do 
    'isn\'t done through the stack!'

  end
  it 'example1: pass args to funcs using the registers' do
    ' write a print function: reuse functionality of printing to screen' 
    'use register eax,ebx to do printing and call this func from different lines in the program'
  end
  describe 'example2: pass args to func using memory pointers defined in .bss' do
    it 'benefits:' do 
      'the function is more secure because manages the registers itself'
    end
    it 'use memory variables as pointer :' do
      '.bss:  use double-word size | 4 bytes | to store address of :'
      'save the pointer to the string start location in 1 place'
      'save the size-of-string in 1 place'
    end

  end

end

