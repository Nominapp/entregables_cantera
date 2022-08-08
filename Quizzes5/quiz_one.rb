puts "Quiz n°1: 1"

x = String.new("i wish i was surfing")
puts x

puts "Quiz n°1: 2"

String.new("i thought he said this wasn't going to be abstract...")

puts "Quiz n°1: 3"

puts "hi".methods()

puts "Quiz n°1: 4"

puts "hello".upcase()

puts "Quiz n°1: 5"

puts "sUp DuDe".swapcase()

puts "Quiz n°1: 6"

puts "This is a sentence, kinda".split()

puts "Quiz n°1: 7"

# object.method

puts "Quiz n°1: 8"

String.new("road trip")

puts "Quiz n°1: 9"

Array.new() # => []

puts "Quiz n°1: 10"

my_array = Array.new()
my_array.push("nice")
my_array.push("hair")
puts my_array.inspect
# ["nice", "hair"]

puts "Quiz n°1: 11 - 13: Theory questions"

puts "Quiz n°1: 14"

Hash.new()

puts "Quiz n°1: 15"

array = ["fun", "games"]
puts array.inspect

puts "Quiz n°1: 16"

my_string = String.new("special")
# my_string.push("cool") undefined method `push' for "special":String

puts "Quiz n°1: 17"

a_string = String.new("ear")
puts a_string.class() # String

puts "Quiz n°1: 18"

an_array = Array.new()
puts an_array.class() # Array

puts "Quiz n°1: 19"

class Animal
end

fido = Animal.new

puts "Quiz n°1: 20"

class Dog
  def speak()
    return("ruff ruff")
  end
end

spot = Dog.new
puts spot.speak

puts "Quiz n°1: 21"

class Penguin
  def self.looks
    "We are cute!"
  end
end

puts Penguin.looks

puts "Quiz n°1: 22"

class Fish
  def self.general_overview()
    return("Fish are animals that live in the sea")
  end
end

puts Fish.general_overview

puts "Quiz n°1: 23"

class Calculator
  def self.add(n1, n2)
    n1 + n2
  end
end

puts Calculator.add(2,2)

puts "Quiz n°1: 23"

class Person
  def initialize(name)
    @name = name
  end
end

puts "Quiz n°1: 24"

class Person # 1
  def initialize(name) # 2
    @name = name # 3
  end
end

puts "Quiz n°1: 25: Theory"

class Person
  def initialize(name)
    @name = name
  end
end

my_person_object = Person.new("Fred")

puts "Quiz n°1: 26: Theory"

class Lion
  def initialize(name)
    @name = name
  end

  def return_lions_name
    return(@name)
  end
end

simba = Lion.new("Simba")
puts simba.return_lions_name() # prints "Simba"

puts "Quiz n°1: 27 - 28"

class Celsius
  def initialize(temperature)
    @temperature = temperature
  end

  def to_fahrenheit
    @temperature * 1.8 + 32
  end
end

temp = Celsius.new(32)
puts temp.to_fahrenheit
