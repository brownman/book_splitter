require 'spec_helper'


describe 'securitytube - asm - part 6: moving data' do
  #false.should == true
  describe 'MOST IMPORTANT: address 0x12345678 !' do
    '1. 0x.. = is a hex representation'
    '2. each number .. represent hex-decimel value - and store 1 byte = 8 bits!'
  end
  describe 'move command' do

    'movl %eax , %ebx' #32 bits , 4 bytes, L:double word, int32|L = DOUBLE WORD
    'movw %ax  , %bx' #16 bit, 2 bytes, Word, int16| W =  WORD
    'movh %ah  , %bh' #8 bit, 1 byte, Half word | H = HALF WORD

    describe 'between: registers:' do
      'movl %eax, %ebx'
    end

    describe 'between registers and a memory :' do
      it 'if defined parameter: location .10 int:' do
        'movl %eax , location'
        'movl location , %ebx'
      end
    end

    describe    'move immidiate value ' do 
      it 'into a register' do
        'movl $10 , %ebx'
      end

      describe  'into a memory location' do
        it 'if defined variable: location: .byte 0 -->' do
          #target:
          'movb $10, location'
          #so:
          'movb $3 , %al; movb %al , ByteLocation'
        end
        pending 'what happend if u want to copy value bigger than a byte: movb $256 to location ?' do
        end
      end

    end
    describe 'move data into indexed  memory location' do
      it 'how to move data by using a register to hold a variable address?' do 
        'question: copy the address of var: int32 to a register, than assign int32 by assignment of its address stored in the register'
      end
      it 'if defined variable: IntegerArray .int 10,20,30,40,50' do
        'movl  %eax , IntegerArray(0->initial offset from first array location ,2->index = number of jumps from offset,4->the size in bytes is 4, which is 1 integer=word=4 bytes)'
        #so..
        'copy immidiate value $3 to ..(%ecx=0, %edi=2 , 4 bytes) - the third element!'
        #examine:
        ':x representatoin:decimal, units: 5 of unit_size: 1int=word  &IntegerArray'
      end
    end
    describe 'like POINTERS: how to store a memory address in a register? =>  indirect addressing using register' do #time: 19:50 
      it 'copy address to register, that assign a value: 9 to it' do 
        #notice sign dolar: $var_name
        'movl $location, %edi' #%edi acts as a pointer to a memmory location
        #notice sign parentesis: ()
        'movl $9, (%edi)' #copy value to memmory addressed by register %edi
        'movl $9, -2(%edi)' #copy value to memmory addressed by register %edi - 2 bytes

      end
    end


  end
  it 'how to move data to %eax ?' do
    'with command: movl (move 32 bits, 4 bytes, double word sign:L)'
  end
  it 'how to examine a memory location => the value pointed by the variable named: .data::Int16 ?'
  ':x 1-decimel-halfWord  &Int16'

end


