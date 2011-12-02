# lambda converts a block to a Proc object
l = lambda { |a| a + 1 }

l = Proc.new { |a| a + 1 }

def convert(&block) # same as using Proc.new to do the conversion
	block
end
l = convert { |a| a + 1 }


# lambda vs. Proc.new 
#  					[parameter passing]
# lambda: 	like method call (checks the number of parameters too)
# Proc.new: parallel assignment (more liberal)

#  					[what 'return' does in each]
# lambda: 	exits proc
# Proc.new: exits surrounding context

def method
	[1,2,3].each do |val| # Proc.new
		puts val
		return if val > 2 
	end
end

# lambda is used to created a block that self-contained code, almost like anonymous methods

# Bindings
class Simple
	def initialize
		@ivar = "ivar with a value"
	end
	def simple(param)
		lvar = 'lvar with a value'
		binding # a kernel method
	end
end

s = Simple.new
b = s.simple(99) { "block value"}

eval "puts param", b
eval "puts lvar", b
eval "puts yield", b
eval "puts self", b
eval "puts @ivar", b

# Binding encapsulates
# - self
# - local variables
# - any associated block
# - return stack

# Ruby associated a binding with every block it creates
def n_times(n)
	lambda { |val| n * val }
end

two_times = n_times(2)
puts two_times.call(3)

eval "n", two_times	  


# Dynamic create methods
class Example
	def one
		def two
		end
	end
end
# two cannot be called until one is called and thus evaluated

# define_method (only available in modules and classes)
class Multipler
	def self.create_multipler(n)
		define_method("times_#{n}") do |val|
			val * n
		end
	end
	
	10.times { |i| create_multipler(i) }
end
 
module Accessor
	def my_attr_accessor(name)
		ivar_name = "@#{name}"
		define_method(name) do
			instance_variable_get(ivar_name)
		end
		define_method("#{name}=") do |val|
			instance_variable_set(ivar_name, val)
		end
	end
end

class Example
	extends Accessor
	my_attr_accessor :var
end











