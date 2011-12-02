# Intercepting unrecognized messages with method_missing

# delegating with method_missing
class Cookbook
	attr_accessor :title, :author
	def initialize
		@recipes = []
	end
	def method_missing(m,*args,&block)
		@recipes.send(m,*args,&block)
	end
end

# Trapping include operations with Module#included

# Module#included is a useful way to hook into the class/module engineering of
# your program.
module M
	def self.included(c)
		puts "I have just been mixed into #{c}."
		class <<c # openup c's singleton class
		end
	end
end
class C
	include M
end

# Intercepting extend
module M
	def self.extended(obj)
		puts "Module #{self} is being used by #{obj}."
	end
	def an_inst_method
		puts "This module supplies this instance method."
	end
end

# Intercepting inheritance with Class#inherited
class C
	def self.inherited(subclass)
		puts "#{self} just got subclassed by #{subclass}."
	end
end
class D < C
end

# The Module#const_missing method
class C
	def self.const_missing(const)
		puts "#{const} is undefined—setting it to 1."
		const_set(const,1)
	end
end
puts C::A
puts C::A

# The method_added and singleton_method_added methods

# Listing an object's methods
object.methods
object.private_methods
object.protected_methods


# Getting class and module instance methods
String.methods.grep(/methods/).sort
# => [:instance_methods, :methods, :private_instance_methods,
# =>  :private_methods, :protected_instance_methods, :protected_methods, 
# =>  :public_instance_methods, :public_methods, :singleton_methods]

# instance_methods returns all public and protected instance methods.
# public_instance_methods returns all public instance methods.
# protected_instance_methods and private_instance_methods return all protected
#   and private instance methods, respectively.

Range.instance_methods(false).sort
# => [:==, :===, :begin, :cover?, :each, :end, :eql?, :exclude_end?, :first,
# :hash, :include?, :inspect, :last, :max, :member?, :min, :step, :to_s]

Range.instance_methods(false) & Enumerable.instance_methods(false)
# => [:first, :min, :max, :member?, :include?]

# Enumerable descendants' overrides of Enumerable instance methods
overrides = {}
enum_classes = ObjectSpace.each_object(Class).select do |c|
	c.ancestors.include?(Enumerable)
end
enum_classes.sort_by {|c| c.name}.each do |c|
	overrides[c] = c.instance_methods(false) &
	Enumerable.instance_methods(false)
end
overrides.delete_if {|c, methods| methods.empty? }
overrides.each do |c,methods|
	puts "Class #{c} overrides: #{methods.join(", ")}"
end

# Class ARGF.class overrides: to_a
# Class Array overrides: collect, count, cycle, drop, drop_while, find_index,
# first, include?, map, reject, reverse_each, select, sort, take, take_while,
# to_a, zip
# Class Enumerable::Enumerator overrides: each_with_index
# Class Hash overrides: include?, member?, reject, select, to_a
# Class Range overrides: first, include?, max, member?, min
# Class Struct overrides: select, to_a

# Listing objects' singleton methods
# Note that singleton_methods lists public and protected singleton methods but 
# not private ones.
c.singleton_methods