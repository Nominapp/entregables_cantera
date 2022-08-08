# 1.
class Dog
  def initialize(name)
    @name = name
  end
end

# 2.
dog = Dog.new("fifi")

# 3.
class Dog
  def initialize(name)
    @name = name
  end

  def bark
    "Ruff ruff"
  end
end

# 4.
ins_dog = Dog.new("fifi")
ins_dog.bark

# 5.
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end
bob = Person.new("Bob", 22)
bob.speak()
# it will return an error becase the speak method doesn't exist in Person "NoMethodError"

# 6.
class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def age_in_years
    @age_in_days.to_f / 365
  end
end

# 7.
class Dog
  def speak()
    return("woof woof")
  end
end
# It will return error because is an instance methods, no a class method

# 8.
class Lamp
  def self.about_me
    "We brighten up people's lives".
  end
end

# 9.
class WaterBottle
  def initialize(size)
    @size = size
  end

  def size_bottle
    @size
  end
end

bottle = WaterBottle.new(40)
puts bottle.size_bottle

# 10.
class Person
  def initialize(age)
    @age = age
  end

  def age=(new_age)
    @age = new_age
  end

  def age
    @age
  end
end
person = Person.new(45)
person.age=(56)
puts person.age

# 11. it will return "AS IF?!"

# 12.
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
person = Person.new
puts person.say_something
alien = Alien.new
puts alien.say_something

# 13.
module MathHelper
  def multiply_by_two(num)
    num*2
  end
end

class Homework
  include MathHelper
end

homework = Homework.new
puts homework.multiply_by_two(5)

# 14.
class Mammal
  def heartbeat?
    true
  end
end

class Dog < Mammal
end

dog = Dog.new
puts dog.heartbeat?
puts dog.methods().include?(:heartbeat?) # It works

# 15.
puts Array.ancestors()

# 16. All classes that we create inherit from object class that has methods that the class can use
# for this reason when we use the method count, it count all methods that the parent class have when we find it

# 17.
class BaseballPlayer
  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average()
    @hits.to_f/@at_bats
  end

  def on_base_percentage()
    (@hits + @walks).to_f/@at_bats
  end
end

player = BaseballPlayer.new(12, 5, 13)
puts player.batting_average
puts player.on_base_percentage

# 18.
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
    "#{first_name} #{last_name}"
  end
end

person = Person.new("caro", "diaz")
puts person.full_name

# 19.
module MathHelper
  def exponent(num1, num2)
    num1**num2
  end
end

class Calculator
  include MathHelper

  def square_root(num)
    exponent(num, 0.5)
  end
end

c = Calculator.new
puts c.square_root(4)
puts c.square_root(5)
