require 'spec_helper'


describe 'securitytube - asm - part 9: conditional branching' do
  it 'function block is..' do
    'instruction set'
  end
  describe 'program execution flow: ' do
    describe 'jump conditionally' do
      it 'asm commands: Jxx : JA, JAE, JE, JG, JZ, JNZ , etc..' do 
        'jump base on state of a flag of sort. flag is on or off'
      end
      it 'flags in use:' do
        'z,p,o,s,c'
      end
      it 'limitation:' do 
        'impossible: far jumps'
      end

      describe  'commands: jz , jnz' do
        it 'when jz leads to a jump?' do
          'when eflag: ZF is set'
        end
        it 'howto set the ZF flag?' do 
          'xor operation on a register:'
          'xorl %eax,%eax'
        end

      end
    end
    describe 'loop' do
      it ':loop label utilizes:' do 
        'register:ecx'
        'set ecx before the loop block of code, :loop command will decrement it by 1 till 0, than stop looping'

      end
      it 'if loop block of code also uses register ecx - we must use the stack appropriatly' do
        'pusshl ecx , loop-block-code, popl ecx'
      end
      it 'loopz, loopnz' do
        'commands that based also on zf flag'
      end
    end
  end
end

