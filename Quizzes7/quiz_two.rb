puts "Quiz n°2: 1"

class Dog
  def initialize(name)
    @name = name
  end
end

puts "Quiz n°2: 2"

a_dog = Dog.new("fido")

puts "Quiz n°2: 3"


class Dog
  def initialize(name)
    @name = name
  end

  def bark
    "Ruff ruff"
  end
end

puts "Quiz n°2: 4"

a_dog = Dog.new("fido")
puts a_dog.bark

puts "Quiz n°2: 5"

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

bob = Person.new("Bob", 22)
# bob.speak | undefined method

puts "Quiz n°2: 6"

class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def age_in_years
    @age_in_days.to_f / 365.26
  end
end

insect = Insect.new(1460)
puts insect.age_in_years

puts "Quiz n°2: 7"

class Dog
  def speak()
    return("woof woof")
  end
end

# Dog.speak() | undefined method

puts "Quiz n°2: 8"

class Lamp
  def self.about_me
    "We brighten up people's lives"
  end
end

puts Lamp.about_me

puts "Quiz n°2: 9"

class WaterBottle
  attr_reader :size

  def initialize(size)
    @size = size
  end
end

bottle = WaterBottle.new(2)
puts bottle.size

puts "Quiz n°2: 10"

class Person
  attr_accessor :age

  def initialize(age)
    @age = age
  end
end

person = Person.new(120)
puts person.age
person.age=(20)
puts person.age

puts "Quiz n°2: 11"

module Clueless
  def funny()
    return("AS IF?!")
  end
end

class Actress
  include Clueless
end

alicia = Actress.new
puts alicia.funny() # AS IF?!

puts "Quiz n°2: 12"

module HappyHappy
  def say_something()
    return("Happy happy, joy joy")
  end
end

class Person
  include HappyHappy
end

class Alien
  include HappyHappy
end

et = Alien.new
pepe = Person.new
puts "instances of the Person class and instances of the Alien class can use the say_something() method." if et.say_something == pepe.say_something

puts "Quiz n°2: 13"

module MathHelper
  def multiply_by_two(number)
    number * 2
  end
end

class Homework
  include MathHelper
end

pepe = Homework.new
pepe.multiply_by_two(5)

puts "Quiz n°2: 14"

class Mammal
  def heartbeat?
    true
  end
end

class Dog < Mammal
end

firulais = Dog.new
puts "instances of the Dog class have access to the heartbeat? method" if firulais.heartbeat?

puts "Quiz n°2: 15"

puts Array.ancestors

puts "Quiz n°2: 16: Theory"

class Box
end

my_box = Box.new

puts "Quiz n°2: 17"

class BaseballPlayer
  def initialize(hits, walks, at_bats)
    @hits = hits.to_f
    @walks = walks.to_f
    @at_bats = at_bats.to_f
  end

  def batting_average
    @hits / @at_bats
  end

  def on_base_percentage
    @hits + @walks / @at_bats
  end

end

mays = BaseballPlayer.new(20, 30, 50)
puts mays.batting_average
puts mays.on_base_percentage

puts "Quiz n°2: 17"

class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def first_name=(first_name)
    @first_name = first_name.capitalize
  end

  def last_name=(last_name)
    @last_name = last_name.capitalize
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

puts "Quiz n°2: 18"

module MathHelpers
  def exponent(base, exponent)
    base ** exponent
  end
end

class Calculator
  include MathHelpers
  def square_root(number)
    exponent(number, 0.5)
  end
end

num = Calculator.new
num.square_root(3)
