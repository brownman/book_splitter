#require 'rubygems'
#require 'bundler'
require 'test/unit'
require 'mocha'



#require 'shoulda'
#

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib/rrrex/lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
#require 'crapshoot'

    begin  
       require 'rrrex'
    rescue Exception => e  
        puts e.message  
        puts e.backtrace.inspect  

      end  


class Test::Unit::TestCase
end
