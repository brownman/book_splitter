require 'spec_helper'


describe 'securitytube - buffer - part 3: executing   shellcode' do
  describe 'workflow' do
    it    'supply compile args:' do
      'gcc -ggdb -preffered-stack-boundary=2 -o example1.o example1.c'
      './example1'

    end
    it 'show return value of last program executed' do

      ':unix command = echo $?'
    end
    describe 'example1.c : lets inspect this program it with gdb:' do 
      it 'inspecting the stack ' do
        'set breakpoint '
        'examine esp: lets view the 8 last elements of the stack'
        '-inside main() - the program define a pointer: named: ret '
        'inside main - the stack contains:
    0 bytes - the supplied args for main(..nothing..) 
    the return address -> wich is eip of program.text.segment_of_line_call_main+4 --> (:dissasm this address to figure out if its the address of the return address: libc_start_main+4)

    the stored value of old ebp register
    the address of the new defined variable : *ret
        '

      end
      describe 'how we replace the return address of main?' do
        it 'using new variable address to travel on the stack' do
          'after definition of: int *ret  , this value is pushed onto the stack - 
        and therefor  &ret is similar to value of esp'
        end


        it 'how we find to the inside_main:stack_return_address::  by using the variable *ret?' do
          '
        we want the address of esp+offset of 2 addresses= 2 bytes offset: 
        it is exacly: address-of-*ret + (int *)var_address+2
        '

        end
        it 'overite the return address with the shellcode[] address' do
         'program execution is changed!' 
        end


      end
    end

  end
end
