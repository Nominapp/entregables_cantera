puts "Question # 1" 
class Dog 
	def initialize(name)
		@name = name
	end 
end 

puts "Question # 2" 
pet = Dog.new("Paco")
puts pet

puts "Question # 3" 
class Dog 
	def initialize(name)
		@name = name
	end
	
	def bark()
		return("Ruff ruff")
	end 
end 

puts "Question # 4" 
pet = Dog.new("Paco")
puts pet.bark()

puts "Question # 5" 
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

bob = Person.new("Bob", 22)
puts "bob.speak()"
puts "undefined method speak"

puts "Question # 6" 
class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

	def age_in_years
		@age_in_days.to_f / 365
	end 
end

age = Insect.new(245)
puts age.age_in_years

puts "Question # 7" 
class Dog
  def speak()
    return("woof woof")
  end
end

puts "Dog.speak()"
puts "undefined method speak"

puts "Question # 8" 
class Lamp
	def self.about_me 
		return("We brighten up people's lives")
	end 
end 

puts "Question # 9" 
class WaterBottle
  def initialize(size)
    @size = size
  end

	def size
		@size
	end 
end

a_waterbottle = WaterBottle.new(5)
puts a_waterbottle.size

puts "Question # 10" 
class Person 
	def initialize(age)
		@age = age
	end 

	def age=(other_age)
		@age = other_age
	end 

	def age 
		@age
	end 
end 

nelson = Person.new(10)
nelson.age = 15
puts nelson.age

puts "Question # 11" 

module Clueless
  def funny()
    return("AS IF?!")
  end
end

class Actress
  include Clueless
end

alicia = Actress.new
alicia.funny()
puts "AS IF?!"

puts "Question # 12" 
module HappyHappy
  def say_something()
    return("Happy happy, joy joy")
  end
end

class Person_new
  include HappyHappy
end

class Alien
  include HappyHappy
end

ana = Person_new.new()
puts ana.say_something

a_alien = Alien.new()
puts a_alien.say_something 

puts "Question # 13" 
module MathHelper
	def multiply_by_two(num)
		num * 2
	end
end 

class Homework
	include MathHelper
end 

math_homework = Homework.new()
puts math_homework.multiply_by_two(10)

puts "Question # 14" 
class Mammal
  def heartbeat?
    true
  end
end

class Animal < Mammal
end

animal = Animal.new()
puts animal.heartbeat?
#animal.methods().include?(:heartbeat?)

puts "Question # 15" 
Array.ancestors()

puts "Question # 16" 
class Box
end

my_box = Box.new
puts my_box.methods().count()

puts "Question # 17" 
class BaseballPlayer
	def initialize(hits, walks, at_bats)
		@hits = hits
		@walks = walks
		@at_bats = at_bats
	end 

	def batting_average()
		@hits.to_f / @at_bats
	end 

	def on_base_percentage()
		(@hits + @walks).to_f / @at_bats
	end 
end 

player = BaseballPlayer.new(200, 100, 2030)
puts player.batting_average()
puts player.on_base_percentage()

puts "Question # 18" 
class Register
	def initialize(name, last_name)
		@name = name 
		@last_name = last_name
	end 

	def first_name()
		@name
	end 

	def last_name()
		@last_name
	end 

	def full_name
		"#{@name} #{@last_name}"
	end 
end 

pedro = Register.new("pedro", "perez")
puts pedro.full_name()

puts "Question # 19" 
module MathHelpers
  def exponent(num1, exponent)
    return(num1 ** exponent)
  end
end

class Calculator
  include MathHelpers

  def square_root(num2)
    return(exponent(num2, 0.5))
  end
end

value = Calculator.new
puts value.square_root(4)
puts value.square_root(5)