# instance_eval and class_eval

# instance_eval
# we can pass in a block rather than a string
instance_eval do
	puts self # outputs main
end

# we can call instance_eval with a receiver
"cat".instance_eval do
	puts self # outputs cat
end

class Thing
	def intialize
		@var = 123
	end
	
	private
	
	def secret 
		puts "I like Ruby"
	end
end

t = Thing.new
puts t.instance_eval { @var }

# private method can only be called without a receiver, using
# instance_eval we can call secret on t without using t as a receiver 
t.instance_eval { secret }

# using instance_eval to define a method on the block
# an anonymous class is created to hold the speak method
animal = "cat"
animal.instance_eval do
	def speak
		puts "miaow"		
	end
end

puts animal.upcase
animal.speak

# create class methods
class Dave
end

Dave.instance_eval do
	def say_hello
		puts "hi"
	end
end


# class_eval (module_eval is same as class_eval)
# can only called on classes and modules
String.class_eval do 
	puts self # outputs String, same as instance_eval
end

# but here
String.class_eval do
	def with_cat # callable with all instances of String, differ from instance_eval
		"kitty says: " + self
	end
end

# Used on a class object, instance_eval gives class methods and class_eval gives instance methods

# instance_eval can be called on all objects (instances and classs)
# class_eval can only be called on classes and modules
# the name reflects the type of receiver is called upon

# When we say instance_eval on a class, it not only creates an anonymous 
# class, but also sets the current_class to reference the anonymous class

# With class_eval on class, no anonymous class created, the current_class
# is set to this class. the methods created goes into this class, which means
# only the instances of this class can call the methods

# receiver			instance_eval			class_eval
# any obj				def -> singleton	n/a
# class/module	def -> singleton	def -> receiver
# 							(class method)		(instance method) 


# Things to do with xxx_eval
# - ignore privacy
# - create methods without using closures (create method on the fly w/o using define_method)
# - DSLs in a block 
 
# Problem with the define_method:
# when you pass in the define method with a block, that block is a closure,
# if you don't need the closure facility, then u waste a bit memory

module Accessor
	def my_attr_accessor(name)
		class_eval%{
			def #{name}
				@#{name}
			end
			def #{name}=(val)
				@#{name}=val
			end	
		}
	end
end

class MyClass
	extend Accessor
	my_attr_accessor :var
end

[ String, Array, Hash ].each do |cls|
	cls.class_eval { include Something } # bypass include being a private method
end

# DSL
class Turtle
	def move(&block)
		# WRONG WAY: instance_eval { yield }, context is not correct
		instance_eval(&block)
	end
	def right
	end
	def up
	end
end
t = Turtle.new
t.move do
	right(3)
	up(2)
	right
end