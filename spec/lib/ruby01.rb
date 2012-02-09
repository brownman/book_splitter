# state + behavior = objects

# object has
# - states (instance variables)
# - methods (method table actually)

# method table points to the obj's class which contains all the methods
# method table is also the 'class pointer'

# self 
# self is the current object
# - default receiver
# - where @var is found

object.do_something(param)
# switch self to receiver (object)
# look up method in self's class
# invoke method

# singleton method (anonymous class inserted between the obj and obj's class)
def animal.speak
  puts "miaow"
end

# class
# a constant that reference to an object, this object is a Class object!
class Carl
  def say_hello
    puts "hi"
  end
end

my_class = Carl
d = my_class.new
d.say_hello

# class don't have to have a name
cls = Class.new
Dave = cls
puts cls # outputs Dave

# class methods don't exist
class Carl
  def self.say_hello
    puts "hi"
  end
end

Carl.say_hello

animal = "cat"
def animal.say_hello
  puts "miaow"
end

animal.say_hello

# comparing these two forms, a singleton method is created
# for animal's say_hello, an anonymous class of animal is inserted
# for Dave's self.say_hello, an anonymous class of Class object Dave is inserted
# and this anonymous class's superclass is Class

# current class
class Dave
  def meth
  end
end

class Dave
  class Carl
    def meth
    end
  end
  def meth
  end
end

def outer_method
end
