require 'spec_helper'


describe 'securitytube - buffer - part 1: smashing the stack' do
  describe 'change program workflow:eip: by supplying args to c.func.gets' do
    'use system command pipe: print abc\xff | ./program_to_run' 
    'if gets fill variable named: buffer[8], out input.first 12 chars will will the stack 12 bytes, than another chars will overflow- the return address of function: input_something()'
    'we need to know how the executed program is layed out in memory: program.segments.text.addresses_of_each_line for finding:  program.text.function2.line_address'
    'when func1 execute: return; than the exploited stack.return_address.ovverided is executed.'
  end
end

