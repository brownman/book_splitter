# Behind the scenes
class Module
	def include(*modules)
		modules.reverse_each do |mod|
			mod.append_self(self)
			mod.included(self)
		end
	end
	def included(mod)
	end
end

class Module
	def included(mod)
		puts "#{self} included #{mod}" # self is the Module, or subclass of it in situation
	end
end

# method hooks
#  method_missing
#  method_added
#  singleton_method_added
#  method_removed
#  singleton_method_removed
#  method_undefined
#  singleton_method_undefined

# class and module hooks
#  inherited
#  append_features
#  included
#  extend_object
#  extended
#  initialize_copy
#  const_missing

# marshalling hooks
#  marshal_dump
#  marshal_load

# coercion hooks
#  coerce
#  induced_from
#  to_xxx


# EXAMPLES
# inherited
class Parent
	def self.inherited(klass)
		puts "#{self} was inherited by #{klass}"
	end
end

class Child < Parent
end

# another example
class ShippingOption
	@children = [] 
	def self.inherited(child)
		# @children ||= [] this is not nessesary, since in self.method, move up 
		@children << child
	end
	
	def self.for(weight, international) 
		@children.select do |child|
			child.can_ship?(weight, international)
		end
	end
end

class MediaMail < ShippingOption
	def self.can_ship?(weight, international)
		!international
	end
end

class PriorityFlatRate < ShippingOption
	def self.can_ship?(weight, international)
		!international && weight < 4 * 16
	end
end

options = ShippingOption.for(3*16, false)
puts options


# automatic add (when putting MediaMail and PriorityFlatRate in another folder)
Dir.glob("shipping_*.rb").each do |name|
	require name
end


# const_missing, an instance method of Module
class Module
	o_c_m = instance_method(:const_missing)
	
	define_method(:const_missing) do |name|
		if name.to_s =~ /^U([0-9a-fA-F]{4})$/
			[$1.to_i(16)].pack("U*")
		else
			o_c_m.bind(self).call(name)
		end
	end
end
puts U0041

class Dave
	def self.const_missing(name)
		puts "Missing #{name} in Dave"
	end
end

Dave::Fred

class Color
	def self.const_missing(name)
		const_set(name, new)
	end
end

puts Color::Red
puts Color::Orange


class ThreatLevel
	def self.const_missing(name)
		const_set(name,new)
	end
end

puts ThreatLevel::Orange != Color::Orange

# now comes Enum
class Enum
	def self.new
		Class.new do
			def initialize(name)
				@name = name
			end
			def self.const_missing(name)
				const_set(name, new)
			end
		end	
	end
end
ThreatLevel = Enum.new
Color = Enum.new
