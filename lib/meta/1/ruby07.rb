# included
module Persistable
	module ClassMethods
		def find
		end
	end
	def self.included(klass)
		klass.extend ClassMethods
	end
end

class Person
	include Persistable
end

# method_added
class Dave
	def self.method_added(name)
		puts "Added method #{name}"
	end
	
	def fred
	end
	
	def wilma
	end
end

# trace method calls
module TraceCalls
	def self.included(klass)
		def klass.method_added(name)
			
			# added to ensure adding 'original_method' won't trigger method_added 
			return if @_adding_a_method 
			@adding_a_method = true
			
			original_method = "original #{name}"
			alias_method original_method, name
			define_method(name) do|*args|
				puts "==> Calling #{name} with #{args.inspect}"
				results = send original_method, *args
				puts "<== result = #{result}"
				result	
			end
			
			@adding_a_method = false
		end
	end
end

class Example
	include TraceCalls
	
	def some_method(arg1, arg2)
		arg1 + arg2
	end
end

# now we add a method2 with a block, we cannot use define_method
# if ruby1.8, so we use xxx_eval, since we want instance methods
# we use class_eval on the class! tricky stuff!
module TraceCalls
  def self.included(klass)
    def klass.method_added(name)    
      return if @_adding_a_method
      @_adding_a_method = true
      TraceCalls.wrap_method(self, name) 
      @_adding_a_method = false
    end
  end
  
  # use '\' to escape!
  def self.wrap_method(klass, name)
    original_method = "_original_#{name}"
    klass.class_eval %{
      alias_method :#{original_method}, :#{name} 
      def #{name}(*args, &block)
        puts "==> Calling #{name} with \#{args.inspect} \#{'(and a block)' if block_given?}"
        result = #{original_method}(*args, &block)
        puts "<<= returns \#{result.inspect}"
        result
      end
     }
   end
end

class Example
  include TraceCalls
  
  def some_method(arg1, arg2)
    if block_given?
      arg1 + arg2 + yield
    else
      arg1 + arg2
    end
  end 
end   

ex = Example.new
ex.some_method(4,5) 
ex.some_method(4,5) { 6 }

# But previous code doesn't cover case like method=, <<
# make method object calls, using instance_method.
module TraceCalls 
  def self.included(klass)
    klass.const_set(:METHOD_HASH, {})  # constants can be shared by class and* instances

    def klass.method_added(name)    
      return if @_adding_a_method
      @_adding_a_method = true
      TraceCalls.wrap_method(self, name) 
      @_adding_a_method = false
    end
  end
  
  def self.wrap_method(klass, name)
    method_hash = klass.const_get(:METHOD_HASH) || fail("No method hash")
    method_hash[name] = klass.instance_method(name)
    klass.class_eval %{
      def #{name}(*args, &block)
        puts "==> Calling #{name} with \#{args.inspect} \#{'(and a block)' if block_given?}"
        result = METHOD_HASH[:#{name}].bind(self).call(*args, &block)
        puts "<<= returns \#{result.inspect}"
        result
      end
     }
  end
end

class Example
  include TraceCalls
  
  def some_method(arg1, arg2)
    if block_given?
      arg1 + arg2 + yield
    else
      arg1 + arg2
    end
  end 
  
  def some_attr=(val)
    @some_attr = val
  end 
  
  def <<(val)
    puts "Pushing #{val}"
  end
end   

ex = Example.new
ex.some_method(4,5) 
ex.some_method(4,5) { 6 }
ex.some_attr = 123
ex << "cat"

# Following code also takes care of tracing existing methods
klass.instance_methods(false).each do |method|
  wrap_method(klass, method.to_sym)
end

# Previous code suffers when tracing "cat" + "dog", it outputs all string
# operations cause + triggered the adding of those string operation method
module TraceCalls 
  def self.included(klass)
    klass.const_set(:METHOD_HASH, {})
    suppress_tracing do 
      klass.instance_methods(false).each do |method|    
        wrap_method(klass, method.to_sym)
      end
    end   
    def klass.method_added(name)    
      return if @_adding_a_method
      @_adding_a_method = true
      TraceCalls.wrap_method(self, name) 
      @_adding_a_method = false
    end
  end

  def self.suppress_tracing
    Thread.current[:'suppress tracing'] = true
    yield
  ensure
    Thread.current[:'suppress tracing'] = false
  end

  def self.ok_to_trace?
    !Thread.current[:'suppress tracing']
  end      
  
  def self.wrap_method(klass, name)
    method_hash = klass.const_get(:METHOD_HASH) || fail("No method hash")
    method_hash[name] = klass.instance_method(name)
    klass.class_eval %{
      def #{name}(*args, &block)  
        if TraceCalls.ok_to_trace?
          TraceCalls.suppress_tracing do
            puts "==> Calling #{name} with \#{args.inspect} \#{'(and a block)' if block_given?}"
          end
        end
        result = METHOD_HASH[:#{name}].bind(self).call(*args, &block)
        if TraceCalls.ok_to_trace?
          puts "<<= returns \#{result}"
        end
        result
      end
    }
  end
end
    
class Array
  include TraceCalls
end

class One
  include TraceCalls
  def in_one
    t = Two.new
    t.in_two
  end
end

class Two
  include TraceCalls
  def in_two
    99
  end
end

One.new.in_one

# Ruby 1.9
module TraceCalls
  def self.included(klass)
    suppress_tracing do
      klass.instance_methods(false).each do |existing_method|
        wrap(klass, existing_method)
      end
    end
    def klass.method_added(method)  # note: nested definition
      unless @trace_calls_internal
        @trace_calls_internal = true
        TraceCalls.wrap(self, method)
        @trace_calls_internal = false
      end
    end
  end
    
  
  def self.suppress_tracing
    Thread.current[:'suppress tracing'] = true
    yield
  ensure
    Thread.current[:'suppress tracing'] = false
  end

  def self.ok_to_trace?
    !Thread.current[:'suppress tracing']
  end      

  def self.wrap(klass, method) 
    klass.class_eval do
      name = method.to_s
      original_method = instance_method(name)

      define_method(name) do |*args, &block|
        if TraceCalls.ok_to_trace?
          TraceCalls.suppress_tracing do
            puts "==> Calling #{name} with #{args.inspect} #{'(and a block)' if block_given?}"
          end
        end
        result = original_method.bind(self).call(*args, &block) # using closure here
        if TraceCalls.ok_to_trace?
          puts "<<= returns #{result}"
        end
        result
      end
    end
  end
end

class Array
  include TraceCalls
end       

class Time
  include TraceCalls
end
 
t = Time.now   
puts t
puts t + 3600
puts t <=> Time.now


class Example
  def one(arg)
    puts "One called with #{arg}"
  end
end

ex1 = Example.new
ex1.one("Hello")     # no tracing from this call

class Example
  include TraceCalls

  def two(arg1, arg2)
    arg1 + arg2
  end
end

ex1.one("Goodbye")   # but we see tracing from these two
puts ex1.two(4, 5) 

class String
  include TraceCalls
end

puts "cat" + "dog"