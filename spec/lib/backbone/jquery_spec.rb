#http://blog.bigbinary.com/2009/08/06/understanding-this-in-javascript-object-literal.html

require 'spec_helper'
describe 'jquery lessons' do
  describe 'anonymous function' do

#http://blog.bigbinary.com/2009/03/13/understanding-jquery-plugin-pattern-and-self-invoking-javascript-function.html
    it 'invokation:' do
      #// original
      #function hello(){ alert('Hello');}

      #// step1 wrap everything in () so that we have a context to invoke
      #(function hello(){ alert('Hello');})

      

      #// now call () to invoke this function
      #(function hello(){ alert('Hello');})();
      


      #$ is nothing else but jQuery object that is being passed while invoking this function.
      #(function($) {
      #// ....
      #})(jQuery);

    end
  end
  describe 'creating a plugin' do
#http://www.learningjquery.com/2007/10/a-plugin-development-pattern
#http://docs.jquery.com/Plugins/Authoring
    it '' do

    end
  end

end

