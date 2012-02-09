require 'spec_helper'

describe 'securitytube - asm - part 3: gdb usage' do
  describe 'gdb: commands' do
    it 'execute program' do 
      'gdb ./SimpleDemo'  
    end

    it 'show source: on line 2' do
      ':list 2'
    end
    it 'run with args' do 
      #the program will calculate the sum of 2 cli args 
      ':run 10 20 #run with 2 args:10,20'
      #gdb execution: also halt on c.gets and show c.puts 
    end
    it 'disassemble' do
      ':disassemble main -> show the function main() in assembler steps'
      ':disassemble add -> show add()'
      'it reveals: '
      'system call to libc: asm::call <atoi@plt> | asm::call <gets@plt>'
    end
    describe 'breakpoint' do

      it 'set a breakpoint at line 9' do
        ':break 9'
      end
      it 'forward: steps in c.code' do
        ':s = 1 step, :c = continue till exit'
      end
      it 'print local data in context of function:add(int x , int y)' do
        ':print x -> gdb.output: $1 = 10'
      end
    end
    describe 'registers' do
      it ':info registers' do
        'gdb.dump: eip <add+13>'
        #control registers not shown
      end
    end
    describe 'memory' do

      describe 'examine the stack:' do

        'help x'
        'esp: x/10(amount of units)x(display.format: hex)b(unit type:bytes) address-of-register-esp'
      end



    end


  end
end
