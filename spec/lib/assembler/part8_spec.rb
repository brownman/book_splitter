require 'spec_helper'


describe 'securitytube - asm - part 8: branching' do

  describe 'program execution flow: ' do
    describe  'unconditional jump:' do
      describe 'jmp' do
        it ':jmp changes' do
          'register eip'
        end

        it ':disas _label' do 
          'the label has a real address in memory!'
        end
        it 'whereami? the program.flow: next instruction:' do

          'gdb: print /x $eip'
        end
        it 'where is the stack pointer?' do
          ':print /x $esp'
        end
        pending 'what is address is stored in esp ?' do 
        end
      end
      describe 'call' do
        'function end with :ret command'
        it 'program utilize the stack' do
          'on :call! - address of next instruction.address is pushed to the stack'
          'on :ret!  - $eip = stack.pop reset execution to the next statement after the :call!' 
        end
      end

    end
  end


end
