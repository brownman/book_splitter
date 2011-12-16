#ref: http://www.robertsosinski.com/2009/01/11/the-difference-between-ruby-symbols-and-strings/
require 'spec_helper'

describe BlockExample do
  #render_views

  describe "simple block" do
    it "collect is already defined in rubycore: Array" do
      array = [1, 2, 3, 4]

      array.collect! do |n|
        n ** 2
      end

      array.should == [1, 4, 9, 16]


    end

    it 'lets mimic collect method' do
      class Array
        def iterate!
          self.each_with_index do |n, i|
            self[i] = yield(n)
          end
        end
      end

      array = [1, 2, 3, 4]

      array.iterate! do |n|
        n ** 2
      end

      array.should == [1, 4, 9, 16]
    end

    it 'using proc.call instead of block.yield' do
      class Array
        def iterate!(&code)
          self.each_with_index do |n, i|
            self[i] = code.call(n)
          end
        end
      end

      array = [1, 2, 3, 4]

      array.iterate! do |n|
        n ** 2
      end

      array.should == [1, 4, 9, 16]
    end


    it 'a block is a proc?' do 
      def what_am_i(&block)
        block.class
      end

      what_am_i {}.should == Proc
    end


    it 'reuse the same block by saving it as a proc instance' do
      class Array
        def iterate!(code)
          self.each_with_index do |n, i|
            self[i] = code.call(n)
          end
        end
      end

      array_1 = [1, 2, 3, 4]
      array_2 = [2, 3, 4, 5]

      square = Proc.new do |n|
        n ** 2
      end
      #square.should == nil 
      array_1.iterate!(square)
      array_2.iterate!(square)

      array_1.should == [1, 4, 9, 16]

      array_2.should ==  [4, 9, 16, 25]

    end
    # => # =>end
    it 'how to implement callbacks using Hash list' do
      def callbacks(procs)
        arr = []
        arr << procs[:starting].call

        arr <<  "Still going"

        arr << procs[:finishing].call
      end

      arr = callbacks(:starting => Proc.new {  "Starting" },
                      :finishing => Proc.new {  "Finishing" })
      arr.should == ["Starting", "Still going", "Finishing"]
      # => Starting
      # => Still going
      # => Finishing
    end
  end
  describe 'lambdas' do

    it 'simple use of lambda' do
      class Array
        def iterate!(code)
          self.each_with_index do |n, i|
            self[i] = code.call(n)
          end
        end
      end

      array = [1, 2, 3, 4]

      array.iterate!(lambda { |n| n ** 2 })

      array.should == [1, 4, 9, 16]
    end
    it 'diff in exception handling ' do 
      def args(code)
        one, two = 1, 2
        code.call(one, two)
      end
      args(Proc.new{|a, b, c|  "Give me a #{a} and a #{b} and a #{c.class}"}).should == "Give me a 1 and a 2 and a NilClass"


      lambda{
        args(lambda{|a, b, c|  "Give me a #{a} and a #{b} and a #{c.class}"})}.should raise_error 
        ArgumentError


        # *.rb:8: ArgumentError: wrong number of arguments (2 for 3) (ArgumentError)
    end
    it 'execute keyword: return' do
      def proc_return
        Proc.new { return "Proc.new"}.call
        return "proc_return method finished"
      end

      def lambda_return
        lambda { return "lambda" }.call
        return "lambda_return method finished"
      end

      proc_return.should == 'Proc.new'

      lambda_return.should == 'lambda_return method finished'
    end
    it 'diff in arity acceptance and allowed keywords' do
      def generic_return(code)
        one, two    = 1, 2
        three, four = code.call(one, two)
        return "Give me a #{three} and a #{four}"
      end

      generic_return(lambda { |x, y| return x + 2, y + 2 }).should == "Give me a 3 and a 4" 



      #lambda {generic_return(Proc.new { |x, y| return x + 2, y + 2 }) }.call.should == nil
      #should_not raise_error LocalJumpError

      #puts generic_return(Proc.new { |x, y| x + 2; y + 2 })

      #puts generic_return(Proc.new { |x, y| [x + 2, y + 2] })
    end
    it 'defined keywords: return keyword cant be used in a proc object' do 
      def get_me_a_return
        Proc.new { return 42 }
      end
      lambda {get_me_a_return.call}.should  raise_error LocalJumpError

    end
    it 'method as sended object' do
      def square(n)
        n ** 2
      end

      method(:square).class.should ==  Method
    end

  end
end

