require 'spec_helper'


describe 'securitytube - buffer - part 4: dissaseble execve ' do
  describe 'use execve: ' do
    describe 'asm: the order in which asm.data is layed out is important: ' do 
      it 'use a register to point to asm.data.array-like structure:' do
      'define 2 asm vars, and make a reg to point to them as array: define:: label1: name, value - label2: name , value --> now if a register is set to point to: label2, it means reg[1] is the address of label1 !'
      end
     it 'in compilation - we state X as preffered-stack-size and we get.. ' do
       '2*X bytes as preserved space on the stack'
     end
     it 'y we pass execve(arg1, arg2_array, arg3) 2 times the address of the file_name to be executed?' do
       'first time: /usr/bin/bash supplyed to arg1 '
       'second time: [/usr/bin/bash,0] supplyed as array to arg2'
     end
     it 'the stack image before calling to system.call.execve:' do
       'low to high memory: arg2:null, arg1:address to some array, arg0: address of a string - which hold the file-system-location-of-the-program-bash-shell'
     end
     it 'shellcode isnt ready yet - because' do
'the machine-code cant be supplyed as feed-of-charecters to a program:
1.it contains: chars with value of null = 0x00
2.it contains: hard-coded address(prompt to run only typical machines=isnt general enough) and not relative addresses
'
     end
    end
  end
  end

