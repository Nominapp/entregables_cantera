puts "Question # 1" 
x = String.new("i wish i was surfing")
puts x 


puts "Question # 2" 
x = String.new("i thought he said this wasn't going to be abstract...")
puts x

puts "Question # 3" 
puts "hi".methods()

puts "Question # 4" 
puts "hello".upcase()

puts "Question # 5" 
puts "sUp DuDe".swapcase()

puts "Question # 6" 
puts "This is a sentence, kinda".split()

puts "Question # 7"
puts "Sintax for calling methods on string objects <stringObject.method>"

puts "Question # 8"
puts String.new("road trip")

puts "Question # 9"
Array.new()
puts "[]"

puts "Question # 10"
my_array = Array.new()
my_array.push("nice")
my_array.push("hair")
my_array.inspect
puts "[\"nice\", \"hair\"]"

puts "Question # 14"
puts Hash.new() 

puts "Question # 15"
arr = Array.new()
arr.push(String.new("fun"))
arr.push(String.new("games"))
puts arr

puts "Question # 16"
my_string = String.new("special")
puts "my_string.push(\"cool\")"
puts "undefined method push"

puts "Question # 17"
a_string = String.new("ear")
a_string.class()
puts "String"

puts "Question # 18"
an_array = Array.new()
an_array.class()
puts "Array"

puts "Question # 19"
class Animal
end

fido = Animal.new()

puts "Question # 20"
class Dog
    def speak()
      return("ruff ruff")
    end
  end

spot = Dog.new()
spot.speak

puts "Question # 21"
class Penguin
    def looks()
        return("We are cute!")
    end 
end 

puts "Question # 22"
class Fish
    def self.general_overview()
      return("Fish are animals that live in the sea")
    end
end

puts Fish.general_overview()

puts "Question # 23"
class Calculartor 
    def self.add(num1, num2)
        return(num1 + num2)
    end 
end 

puts Calculartor.add(2,1)

puts "Question # 24"
class Person
    def initialize(name)
      @name = name
    end
  end
puts "Class Person, Initialize() method and instance variable @name" 

puts "Question # 25"
class Person
  def initialize(name)
    @name = name
  end
end
  
my_person_object = Person.new("Fred")

puts "Question # 26"
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

puts "Question # 27"
class Celsius
	def initialize(temperature)
		@temperature = temperature
	end
end 

puts "Question # 28"
class Celsius
	def initialize(temperature)
		@temperature = temperature
	end 
	
	def to_farenheit()
		@temperature*1.8 + 32
	end 
end 

result = Celsius.new(5)
puts result.to_farenheit()