# 9 examples for memorization

# 1. inside the class
# 2. using subclassing
# 3. subclass with generator

class Discounter 
	def discount(*skus)
		expensive_discount_calculation(*skus)
	end
	
	private
	def expensive_discount_calculation(*skus)
		puts "Expensive calculation for #{skus.inspect}"
		skus.inject { |m, n| m + n }
	end
end

def memoize(cls, method)
	Class.new(cls) do
		memory = {} # use closure to keep state as oppose to using instance vars!!!
		define_method(method) do|*args|
			if memory.has_key?(args)
				memory[args]
			else
				memory[args] = super
			end
		end
	end
end

d = memoize(Discounter, :discount).new 
puts d.discount(1,2,3)

# 4. using anonymous class
d = Discounter.new
def d.discount(*skus)
	@memory ||= {}
	if @memory.has_key?(skus)
		@memory[skus]
	else
		@memory[skus] = super
	end
end

# 5. using anonymous class with generator
def memoize(obj, method)
	anony = class << obj; self; end 
	# do this so that we can call super since new method is in anonymous class
	# the original method is in anonymous's superclass, the real Discounter
	anony.class_eval do
		memory ||= {}
		define_method(method) do |*args|
			if memory.has_key?(args)
				memory[args]
			else
				memory[args] = super
			end		
		end
	end
end

d = Discounter.new
memoize(d, :discount)

# 6. method rewriting, using alias_method
class Discounter # reopen
	alias_method :_original_discount_, :discount
	def discount(*skus)
		@memory ||= {}
		if @memory.has_key?(skus)
			@memory[skus]
		else
			@memory[skus] = _original_discount_(*skus)
		end		
	end
end

# 7. rewrite using module
class Discounter 
	extend Memoize
	
	def discount(*skus)
		expensive_discount_calculation(*skus)
	end
	
	remember :discount
	
	private
	def expensive_discount_calculation(*skus)
		puts "Expensive calculation for #{skus.inspect}"
		skus.inject { |m, n| m + n }
	end
end

module Memoize
	def remember(name)
		
		original = "_original_#{name}"
		
		alias_method original, name
		
		memory ||= {}
		define_method(name) do |*args|
			if memory.has_key?(args)
				memory[args]
			else
				memory[args] = send orignal, *args # use send to invoke method name as var
			end	
		end
	end
end

# 8. rewrite using bind
module Memoize
	def remember(name)
		
		orignal_method = instance_method(name)
		
		memory ||= {}
		define_method(name) do |*args|
			if memory.has_key?(args)
				memory[args]
			else
				# bind those method to an object
				bound_method = original_method.bind(self)
				memory[args] = bound_method.call(*args)
			end	
		end
	end
end

# 9. DSL
class Discounter 
	extend Memoize
	
	remember :discount do |*skus|
		expensive_discount_calculation(*skus)
	end
	
	private
	def expensive_discount_calculation(*skus)
		puts "Expensive calculation for #{skus.inspect}"
		skus.inject { |m, n| m + n }
	end
end

module Memoize
	def remember(name, &block)
		
		define_method(name, &block)
		orignal_method = instance_method(name)
		
		memory ||= {}
		define_method(name) do |*args|
			if memory.has_key?(args)
				memory[args]
			else
				# bind those method to an object
				bound_method = original_method.bind(self)
				memory[args] = bound_method.call(*args)
			end	
		end
	end
end