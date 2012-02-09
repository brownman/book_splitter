require 'spec_helper'


describe 'securitytube - asm - part 11: functions stack' do
  describe 'how to use register: esp , ebp' do

    describe  'workflow' do 
      it 'main()  -  code around the func.call: how to maintain esp?' do 

        '- we want esp to be reset on function.exit to same state it was before the func calling'
        'push something1 to stack, push something2 to stack, function.call, restore esp to be esp+8'
      end

      it 'if eip points to: line x: function.call , reference: line x+1: as eip+8' do



        'when function is called stack.return_address <= eip+8 is pushed to the stack!' 
        'when function is  exited eip <= stack.return_address' 
        'when entering function: esp points to stack.return_address - the asm: :ret command will maintain eip for us by poping the stack '

      end
      it 'inside function: ebp use:  ' do 
        'will use us to access the stack above current.esp' 
        'backup ebp.old.value to the stack. than use ebp to manage the stack in the context of this.func by ebp <= esp' 
        ''

      'inside.function: 1.save ebp to stack ,2. backup esp address with ebp,  play,2. restore esp,  1.restore ebp'
      end
      




    end
  end
end

