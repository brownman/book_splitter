require 'spec_helper'


describe 'securitytube - buffer - part 6: exploiting a program' do
  describe 'use the shellcode to run itself ' do
      it 'let: the program: example.c has buffer-of 80 bytes-20 word' do
        'last word is the return_address hence we want to overrite that address with the address of our shellcode - but where its layedout ?'
    end
      it 'we can run the program twice - first we have to spot the address of the shellcode in the program' do

      end
  end
end

