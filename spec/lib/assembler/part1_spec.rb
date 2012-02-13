require 'spec_helper'


describe 'security tube - asm - part1' do
  describe 'c.lang: when a variable is defined - or a func is called - the stack reflect it..so: ' do
    'example.c
    main()
    {
    int x;
    }
    &x is the last element pushed to the stack - outcome are:
  - stack.0 -  has &x
  - stack.1 -  has reg.ebp-old 
  - stack.2 -  has return_address=the line after main is called.

  there for: an access to the stack is possible by using: &x


  int*(x.address)+0 --> stack.0
  int*(x.address)+1 --> stack.1
  int*(x.address)+2 --> stack.2
    '
  end
  
  describe 'sizes' do
    '
bit A single binary digit, that can have either value 0 or 1.
byte 8 bits.
nybble 4 bits.
*int address ---- word 32 bits
halfword 16 bits
doubleword 64 bits
    '

  end
  describe 'printing with gdb' do

    describe 'asm.lang' do
      it 'show the last 8 stack elements:'  do
        'x/8xw $esp'
      end
    end

    describe 'c.lang' do
      it 'char shellcode[]' do
        'print &variable - show address in hex'
      end
    end

  end
  describe 'addressing in c program' do
    #http://publications.gbdirect.co.uk/c_book/chapter5/pointers.html
    describe 'the address of: ' do
      describe 'char shellcode[]' do

        it 'divide the char_array to word-units' do

          'int *ret = (int)shellcode'
        end
        it 'access the 2nd 32bits/word' do
          'ret[1]'

        end
      end

    end

  end

  describe 'system consist of:' do
    it '3 parts:' do 
      "io device, memory , cpu"
    end
    it 'connected through:' do
      "system bus"
    end


    describe 'CPU: cpu consist of:' do
      it 'storage' do
        'flags, registers'
      end
      it 'execute' do
        'execution unit'
      end
      it 'decode the instruction' do
        'control unit'
      end


      describe 'cpu registers' do
        it 'general purpose' do
          'EAX, EBX , ECX , EDX , ESI, EDI , ESP , EBP'
        end
        it 'segment register' do
          'CS , DS , SS , ES , FS , GS'
        end
        it 'instruction pointer' do
          'EIP' 
        end
        it 'control' do
          'CR0, .. , CR4'
        end

        describe 'introduce the registers of type: general purpose' do

          it 'EAX' do
            'accumulator: store operands OR result data'
          end
          it 'EBX' do
            'base : points to data'
          end
          it 'ECX' do
            'counter : loop operations'
          end
          it 'EDX' do
            'data : i/o pointer'
          end

          it 'ESI , EDI' do
            'data pointer: for memory operations'
          end

          it 'ESP' do
            'stack pointer'
          end
          it 'EBP' do
            'stack data pointer'
          end
          describe 'i32 architecture: how to access low-order bits' do
            'EAX 32|AX 16| AL 0-7 | AH 8-15' 
          end
        end

      end


      describe 'MEMORY: The virtual memory model: The layout..' do
        it 'proccess =' do
          'system meet a program and add it as a new proccess '
        end


        describe 'layout of a proccess in the system memory: ' do
          describe   'segmentation: blocks of memory from-low-to-high address' do
            it '.text' do
              'whole program code!!!!!'
            end
            it '.data' do 
              'intialized data'
            end
            it '.bss' do
              'un-intialized data'
            end
            it 'heap :' do 
              'dynamic memmory- malloc()'

            end
            it 'un-used memory' do
              'i guess this memory space is the malloc() food'
            end
            it 'stack' do
              'store functions vars + local variables'
            end
            pending 'which registers work for certain segmant' do
              'ECX register - will work for: ..the code segment'

            end
          end
          describe 'the heap: ' do
            it 'lifo operations' do
              'push, pop - add/remove value'
            end
            it 'register at work:' do
              'ESP - points the address of the top of the stack'
            end
          end
        end




      end


    end
  end
end
