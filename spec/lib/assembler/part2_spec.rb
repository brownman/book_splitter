require 'spec_helper'

describe 'securitytube - asm - part 2' do
  describe 'memory examination: by linux commands' do
    it 'command line:' do
      '1. edit: SimpleDemo.c'
      '2. compile: gcc -ggdb -o SimpleDemo SimpleDemo.c #warning: gets is insecure function'
      '3. run the program: ./SimpleDemo 10 20 #the gets function is interupting, output: calculate the sum'
      #linux system:
      '4. proccess id: ps -aux | grep SimpleDemo' 
      '5. ls /proc #proccesses happening in the kernel - a directory is  correspond to a proccess_id'

      
      #assume proccess id is PROCCESS_ID
    
      '6. cat /proc/PROCCESS_ID/maps #dump of the virtual-memmory segments: address-permission-data assosiate to it: like libc.so'
      '7. uname -a #show linux kernel version'
      '8. randomize address of a proccess stack on each execusion? #'
      '9. cat /proc/sys/kernel/randomize_va_space'
      '10. if do: echo 0 > randomize_va_space than all proccess\'s stack.tail address will be the same'
    end
  end

end
