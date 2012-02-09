require 'spec_helper'


describe 'securitytube - asm - part 4: hello_world' do
  #false.should == true
  describe 'linux system call: kernel access to a proccess ' do
    it 'what sys.call available?' do
      'cat /usr/include/asm/unistd.h'
      #in c program: exit(), write() , read() etc.
    end
    it 'c.main is like asm.' do
      'the label: _start:'
    end
    describe 'sys::exit.id  is 1' do

      it 'c.exit' do
        'exit()'
        'exit(1) - with status code sent to the sys.env'
      end
      it 'asm.exit' do
        #eax-the system call id number
        'movl $1, %eax'
        #ebx-first arg, ecx-second arg, etc.
        'movl $0 , %ebx'
        #proccess invoke a call to the system.kernel by hundle:software_interupt
        'int 0x80'
      end
    end

  end

end

