# Prototype-based
# - no distinction between classes and objects

clone # copies the objs and its singleton methods 
      # more powerful since copies both state and behavior
dup   # copies the objs but not its singleton methods


# Inheritance
# - inheritance is not good for method sharing, when module is better

# singleton class
class << obj
end
# creates an anonymous class (Singleton class) of instance obj

# when obj is a Class object, same thing happens:
# an anonymous class of Class object is created, and methods inside
# becomes the class methods of the Class object. ex:
class Carl
  class << self
    def say_hello
      puts "hi"
    end
  end
end

Carl.say_hello

# class instance variable and how to create accessor for it
class Carl
  @count = 0
  class << self
    attr_accessor :count
  end
end


# Module and Mixins
# - used as a namespace
# - mixin

# include
class Truck
  include Logger 
  # methods in Logger made available in class train of objects of class Truck
  # an anonymous class is inserted between object of class Truck and its superclass Object
end

# extend
animal.extend Logger

class << animal
  include Logger
end

class Truck
  extend Logger # add class methods to Truck
end

# hook methods to add both class and instance methods
module Persistable
  
  def self.included(cls)
    cls.extend ClassMethods
  end
  
  module ClassMethods
    def find
      puts "In find"
      new
    end
  end
      
  def save
    puts "In save"  
  end
end

class Person
  include Persistable
end

