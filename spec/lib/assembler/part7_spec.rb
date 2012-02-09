require 'spec_helper'


describe 'securitytube - asm - part 7: working with strings' do
  it 'where string saved in memory ?' do
    'program.bss segment : initialized variables before program.text segment is executed'

  end
  it 'gdb: examine the address of a variable' do
    'print /x &HelloWorldString' #output: $7 = 0x12345678
  end
  it 'gdb: examine the value of a reg' do
    #note: a reg hasn't got an address, it doesn't located on memory!

    'print /x $esi' #output in hex: $8 = 0x12345678
    'print /c $eax' #output in ascii: $output-id-counter = 0x12345678

    'print $eax' #output: $9 = 0x12345678
    describe 'output --all-- string pointed by register esi' do

    'x/1s $esi  '
    end

  end




  describe  'move a string: in memmory : from one location to another' do

    it 'asm command: movsX src,dest' do
      'movsX: MovStringSize  reg_source,reg_destination'
      'X: move amount of x bytes at a time:  x=? :  L:double_word|W:word|B:byte'
    end


    describe 'simple program: copy charecters from 1 string to another: ' do 
      describe  'make the register to point to memmory addresses' do 
        #always: address is 32bits value
        #$var_name: use dolar sign: to access address of defined variable
        #to store memory address use spacific registers: esi , edi
        it '1.point' do 
          'use registers:esi,edi -  as pointer to defined parameters/memory adresses:'
          'store address of a string in a source-register: esi' 

          '2 options: for storing address:' 
          'leal source_str , %esi'
          'movl $source_str , %esi'

          'store address of a string in a destination-register: edi' 
          'movl $dest_str , %edi'

        end
        it '2.copy' do 
          'movsl: always use edi, edi !'
        end
        it 'FD flag:in what direction we want movlx to copy? up:1/down:0' do 
          'set it with: std'
          'clear it with: ctd'
        end
        it 'asm command: rep:' do 
          'repit command %ecx number of times '

        end

      end

    end



  end
  describe 'asm command: lodsX' do
    describe 'use for: loading string from memory:|| use registers: esi.as.pointer into eax' do
      'load string to register: eax'
      'lodsX: x=? : b/w/l #will result in esi.value to advance 1/2/4 bytes'

      it 'load string value to register' do 
        'lodsb #will copy 1 byte to eax'

        'lodsl #will copy 4 byte to eax'
      end
      it 'reset esi as pointer: decrement it!' do
        'after lodsb -> dec %esi #change esi value by 1 byte'

        'after lodsw ->subl $2, %esi #change esi value by 2 byte'
      end

    end

  end
  describe 'store strings from register to memory' do 
   'asm command: lodsX, use registers: eax , edi' 
   
  end
  describe 'asm command: cmpsX' do 
    'use registers: esi, edi + zf flag:equal0,unequal1'

  end
end

#false.should == true
