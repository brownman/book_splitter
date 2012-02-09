require 'spec_helper'


describe 'security tube - asm - part1' do
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
