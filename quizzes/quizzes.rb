puts "Ejercicio: Make the following object: 'i thought he said this wasn't going to be abstract...'"

puts String.new("i thought he said this wasn't going to be abstract...")

puts "Ejercicio: Create a Hash objetc"

puts Hash.new

puts "Ejercicio: Create a new Array object and add two string objects to it: 'fun' and 'games'."

array = Array.new
array.push("fun")
array.push("games")

p array

puts "Ejercicio: Create an instance of the Animal class and assign it to the variable fido."

class Animal
end

fido = Animal.new

puts "Ejercicio: Create an instance of the Dog class and assign it to the variable spot. Then call the speak() method on the spot dog object."

# class Dog
#   def speak()
#     return("ruff ruff")
#   end
# end

# spot = Dog.new
# puts spot.speak

puts "Ejercicio: Define a Penguin class with a looks() method that returns 'We are cute!'."

class Penguin

	def looks
		'We are cute!'
	end

end

puts "Ejercicio: Call the general_overview() method on the Fish class."

class Fish
  def self.general_overview()
    return("Fish are animals that live in the sea")
  end
end

puts Fish.general_overview

puts "Ejercicio: Define a Calculator class with an add() class method. Demonstrate how the add() method can be called to add two numbers."

class Calculator

	def self.add(n1, n2)
		n1 + n2
	end

end

puts Calculator.add(5, 5)

puts "Ejercicio: Create a Celsius class that is initialized with temperature."

# class Celsius
# 	def initialize(temp)
# 		@temp = temp
# 	end
# end

puts "Ejercicio: Add a method to_fahrenheit() to the Celsius class that converts the Celsius temperature to Fahrenheit. The formula to convert Celsius to Fahrenheit is the temperature in Celsius times 1.8 plus 32."

class Celsius
	def initialize(temp)
		@temp = temp
	end

	def to_fahrenheit
		@temp * 1.8 + 32
	end
end

tempC = Celsius.new(10)
puts tempC.to_fahrenheit

puts "Ejercicio: Create a Dog class that is initialized with a name."

# class Dog
# 	def initialize(name)
# 		@name = name
# 	end
# end

# puts Dog.new("firulais")

puts "Ejercicio: Add a bark() instance method to the Dog class that returns 'Ruff ruff'."

# class Dog
# 	def initialize(name)
# 		@name = name
# 	end

# 	def bark
# 		"Ruff ruff"
# 	end
# end

# puts Dog.new("firulais").bark

puts "Ejercicio: Add an instance method to the Insect class to calculate the age_in_years."

class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def calculate_age_in_years
  	@age_in_days.to_f / 365
  end
end

puts "Ejercicio: Create a Lamp class with a class method called about_me that returns the String 'We brighten up people's lives'."

class Lamp 

	def self.about_me
		"We brighten up people's lives"
	end

end

puts "Ejercicio: Add a method to the WaterBottle class that returns the size of the WaterBottle and demonstrate how this method can be used."

class WaterBottle
  def initialize(size)
    @size = size
  end

  def size
  	@size
  end
end

bottle = WaterBottle.new(18)
bottle.size

puts "Ejercicio: Create a Person class that is initialized with an age and create an age=() 
			method that can be used to update the @age instance variable. Also include an age method
			that returns the value of the @age instance variable. Demonstrate how the methods can be
			used."

# class Person
# 	def initialize(age)
# 		@age = age
# 	end

# 	def age=age
# 		@age = age
# 	end

# 	def age
# 		@age
# 	end
# end

# person1 = Person.new(19)
# puts person1.age
# person1.age = 23
# puts person1.age

puts "Ejercicio: Demonstrate that instances of the Person class and instances of the Alien class can use the say_something() method."

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

person2 = Person.new
alien = Alien.new

puts person2.say_something
puts alien.say_something

puts "Ejercicio: Create a module called MathHelper with a method multiply_by_two() 
			that takes a number as an argument and multiplies it by two. Create a class 
			called Homework and demonstrate how multiply_by_two() can be used."

# module MathHelper
# 	def multiply_by_two(n)
# 		n * 2
# 	end
# end

# class Homework
# 	include MathHelper
# end

# tarea = Homework.new

# puts tarea.multiply_by_two(4)

puts "Ejercicio: Demonstrate that instances of the Dog class have access to the heartbeat? method."

class Mammal
  def heartbeat?
    true
  end
end

class Dog < Mammal
end

perro = Dog.new

puts perro.heartbeat?

puts "Ejercicio: Show all the classes that the Array class inherits from."

puts Array.ancestors

puts "Ejercicio: Create a BaseballPlayer class that is initialized with hits, walks, 
			and at_bats. Add a batting_average() method that returns hits divided by at_bats 
			as a floating point number. Add an on_base_percentage() method that returns 
			(hits + walks) divided by at_bats as a floating point number. Demonstrate how the 
			batting_average() and on_base_percentage() methods can be used."

class BaseballPlayer

	def initialize(hits, walks, at_bats)
		@hits = hits
		@walks = walks
		@at_bats = at_bats
	end

	def batting_average
		@hits.to_f / @at_bats.to_f
	end

	def on_base_percentage
		(@hits + @walks).to_f / @at_bats.to_f
	end

end

player = BaseballPlayer.new(20, 14, 6)
puts player.batting_average
puts player.on_base_percentage

puts "Ejercicio: Create a Person class that is initialized with a first_name 
			and last_name. Create first_name() and last_name() methods that return 
			the values of the corresponding instance variables. Create a full_name() 
			method that concatenates the first_name and last_name in a single string."

class Person
	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end

	def first_name
		@first_name
	end

	def last_name
		@last_name
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end
end

tobiasMedrano = Person.new("Tobias", "Medrano")

puts tobiasMedrano.first_name
puts tobiasMedrano.last_name
puts tobiasMedrano.full_name

puts "Ejercicio: Create a module called MathHelpers with the exponent() 
			method that takes a two numbers as arguments and raises the first number 
			to the power of the second number. Create a class called Calculator with 
			a method called square_root() that takes the square root of the number 
			(raises it to the power of 0.5). The square_root() method should use the
			exponent() method."

module MathHelper
	def exponent(base, e)
		base**e
	end
end

class Calculator
	include MathHelper

	def square_root(sr)
		exponent(sr, 0.5)
	end
end

calculator = Calculator.new
puts calculator.square_root(16)