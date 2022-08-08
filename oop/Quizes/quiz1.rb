# 1. The value of x is "i wish i was sirfing"

# 2.
y = "i thought he said this wasn't going to be abstract..."

# 3. It will return the methods that "hi" can use.

# 4. It will return "HELLO" in other words it returns the object in uppercase

# 5. It return the string with the case changed, the uppercase in downcase and in the other way

# 6. It will return an array with the string separated by the space

# 7. the sintax is the object, followed by a dot and followed by the method that we want to uppercase

# 8.
string_object = "road trip"

# 9. The code will return an empty array object

# 10. It will print the content of the array

# 11. A class is a template for creating objects, it has methods that we can use

# 12. An object is an instance of a class

# 13. A string object can be created in two ways. the first one with String.new("this is a string")
# and the second with a variable example: string_object = "this is a String"

# 14. Like String, you can create a hash with the method new -- Hash.new

# 15.
array_object = []
array_object.push("fun")
array_object.push("games")

# 16. This code doesn't work because the class String doesn't has the method push

# 17. The code evaluate which class the object belongs, in this case it belongs to the class string

# 18. It return array because an_array belongs to that class

# 19.
class Animal; end
fido = Animal.new

# 20.
class Dog
  def speak()
    return("ruff ruff")
  end
end
spot = Dog.new
spot.speak()

# 21.
class Penguin
  def looks
    "We are cute!"
  end
end

# 22.
class Fish
  def self.general_overview()
    return("Fish are animals that live in the sea")
  end
end
Fish.general_overview

# 23.
class Calculator
  def self.add(x, y)
    x + y
  end
end
Calculator.add(2,5)

# 24.
class Person
  def initialize(name)
    @name = name
  end
end
#The key components is initialize becasu that is the method that run when we create an object with .new
# and @name is creating a instance variable that we can use in the class

# 25.
class Person
  def initialize(name)
    @name = name
  end
end

my_person_object = Person.new("Fred")
# the .new method call the initialize and with the instance variable @name it create the object with name Fred

# 26.
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
# The return_lions_name return the instance variable that we have in initialize

# 27.
class Celsius
  def initialize(temperature)
    @temperature = temperature
  end
end

# 28.
class Celsius
  def initialize(temperature)
    @temperature = temperature
  end

  def to_fahrenheit
    @temperature*1.8+32
  end
end
