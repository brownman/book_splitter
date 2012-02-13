require 'spec_helper'


describe 'securitytube - buffer - part 5: shellcode for execve ' do
  describe 'use execve: refine the shellcode ' do
    pending 'putting the file_name string - in relative address' do
      #not sure yet..
      it 'in this example: we supply all execve.args in 1 data.string ' do

      end

    end
    describe 'eliminate null values - technicks' do
      it 'xor eax,eax' do
        'retult eax = 0x00000000'
      end
      describe 'removing zeros - refine machine-code commands' do
        it 'system.call.assignment: dont move to eax-only to al' do
          'movlb 11, al'
        end


      end

    end
  end
end

