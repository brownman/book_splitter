require 'spec_helper'


describe 'securitytube - buffer - part 2: writing exit shell code' do
  describe 'workflow' do
    it 'payload/shellcode, - spawn the shell after buffer-overflow attack'  do 
      'executable code = code is already in machine code - doesnt require extra compiling !'
    end
    it 'cook code:' do
      'write the code for example: in c language'
      'compile the code'
      'examine the machine-code and remove unneccessary code'
      're-write the asm code in assembly'
      'use objdump -d program_name: utility to see the machine-code - this is the final shellcode!'
      'now we have a payload!'
    end
    it 'example: write a program that only exit' do
      'compile it with static linking - now libc._exit code also included!'
    end
    it ':dissasm _exit' do
      'we can notice: 2 system calls: by spotting :asm -> int 0x80'
      'register eax <= SYSTEM_CALL_ID'
      #inspect /usr/include/asm/unistd.h for system calls:
      'eax assigned with: 2 system calles: exit , and exit_group'
#_exit() dissassembled: 
      #mov $0xfc , %eax
      #int $0x80
      #mov $0x1 , %eax
      #int $0x80
    end
    it 'access the api for system calls: exit_group(..) is doing ?' do
      'man exit_group'

    end
    it 'is the asm code is spacific to a machine?' do
      'no, the compiler cook the machine-code by the asm-compiler for the target-of-choice machine-architecture'

    end
    it 'executing shellcode in c program' do
      'cpu_command:bb , is the compiled command for: movl'
      'char first[] = \"\\xbb\\x00\\x.. .. .. \"'
'this command is 8 bytes long:  00 00 00 00'
    end
  end
end
