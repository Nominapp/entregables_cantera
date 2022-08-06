puts "Classes And Objects 1: Find the class"

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

puts "\nClasses And Objects 1: Create the Class"

class Cat
end

puts "\nClasses And Objects 1: Create the Object"

kitty = Cat.new

puts "\nClasses And Objects 1: What Are You"

class Cat
	def initialize
		puts "I'm a cat!"
	end
end

puts "\nClasses And Objects 1: Hello, Sophie! (part 1)"

class Cat
  def initialize(name)
  	@name = name
    puts "Hello! My name is #{@name}" 
  end
end

kitty = Cat.new('Sophie')

puts "\nClasses And Objects 1: Hello, Sophie! (part 2)"

class Cat
  def initialize(name)
  	@name = name
  end

  def greet
  	puts "Hello! My name is #{@name}" 
  end
end

kitty = Cat.new('Sophie')
kitty.greet


puts "\nClasses And Objects 1: Reader"

class Cat
	attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet


puts "\nClasses And Objects 1: 	Writer"

class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

puts "\nClasses And Objects 1: 	Accessor"


class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

puts "\nClasses And Objects 1: 	Walk the Cat"

module Walkable
	def walk
		puts "Let's go for a walk!"
	end
end

class Cat

	include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk

puts "\nClasses And Objects 2: 	Generic Greeting (part 1)"

class Cat

	def self.generic_greeting
		puts "Hello! I'm a cat!"
	end

end

Cat.generic_greeting

puts "\nClasses And Objects 2: 	Generic Greeting (part 2)"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{self.name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

puts "\nClasses And Objects 2: 	Hello, Chloe!"

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

puts "\nClasses And Objects 2: Identify Yourself (part 1)"

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end

end

kitty = Cat.new('Sophie')
p kitty.identify

puts "\nClasses And Objects 2: Identify Yourself (part 2)"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{@name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty

puts "\nClasses And Objects 2: Counting Cats"

class Cat
	@@total = 0
	def initialize
		@@total +=1
	end

	def self.total
		puts @@total
	end
end


kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

puts "\nClasses And Objects 2: Colorful Cat"

class Cat

	COLOR = "purple"

	def initialize(name)
		@name = name
	end

	def greet
		puts "Hello! My name is #{@name} and I'm a #{Cat::COLOR} cat!"
	end

end


kitty = Cat.new('Sophie')
kitty.greet
kitty2 = Cat.new('Doc')
kitty2.greet

puts "\nClasses And Objects 2: Public Secret"

class Person

	def secret=secret
		@secret = secret
	end

	def secret
		@secret
	end

end


person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

puts "\nClasses And Objects 2: Private Secret"

class Person
  attr_writer :secret

  private

  attr_reader :secret

  public 

  def share_secret
    puts @secret
  end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

puts "\nClasses And Objects 2: Protected Secret"

class Person
  attr_writer :secret

  def compare_secret(obj)
    obj.secret == self.secret ? true : false
  end

  protected

  attr_reader :secret
  
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'



puts person1.compare_secret(person2)

puts "\nInheritance:	Inherited Year"

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

puts "\nInheritance:	Start the Engine (Part 1)"

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
    start_engine
  end
end

class Truck < Vehicle

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

puts "\nInheritance:	Start the Engine (Part 2)"

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    puts super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

puts "\nInheritance: Only Pass the Year"

class Vehicle
  attr_reader :year

  def initialize(year, bed_type)
    @year = year
    @bed_type = bed_type
  end
end

class Truck < Vehicle
  
  attr_reader :bed_type
end

class Car < Vehicle
    def initialize(year)
    @year = year
  end
end

truck1 = Truck.new(1994, 'Short')
car1 = Car.new(1984)
puts truck1.year
puts truck1.bed_type

puts "\nInheritance: Towable (Part 1)"

module Towable
	def tow
		puts 'I can tow a trailer!'
	end
end

class Truck
	include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow

puts "\nInheritance: Towable (Part 2)"

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle

  attr_reader :year

  def initialize(year)
    @year = year
  end

end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year

puts "\nInheritance: Method Lookup (Part 1, 2, 3)"

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

puts Animal.ancestors

puts "\nInheritance:	Transportation"

module Transportation
	class Vehicle

	end

	class Truck < Vehicle

	end

	class Car < Vehicle

	end
end

puts "\nAccessor Methods:	Reading and Writing"

class Person
	attr_accessor:name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

puts "\nAccessor Methods: Choose the Right Method"

class Person
	attr_accessor :name, :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

puts "\nAccessor Methods: Access Denied"

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number

puts "\nAccessor Methods: Comparing Names"

class Person

  attr_writer :last_name
  attr_accessor :first_name

  def first_equals_last?
    first_name == @last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

puts "\nAccessor Methods: Who is Older?"

class Person

  attr_accessor :age

  def older_than?(other)
    @age > other.age
  end
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

puts "\nAccessor Methods: Guaranteed Formatting"

class Person
	attr_writer :name
	def name
		@name.capitalize
	end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name


puts "\nAccessor Methods: Prefix the Name"

class Person
	attr_writer :name

	def name
		"Mr. " + @name
	end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

puts "\nAccessor Methods: Avoid Mutation"

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

person1 = Person.new('James')
person1.name.reverse
puts person1.name

puts "\nAccessor Methods: Calculated Age"

class Person

	def age=(age)
		@age = age * 2
	end

	def age
		@age * 2
	end

end

person1 = Person.new
person1.age = 20
puts person1.age

puts "\nAccessor Methods: Unexpected Change"

class Person

  def name=name
    @name = name.split
  end

  def name
    @name.join(' ')
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

puts "\nAccessor Methods: 	Banner Class"

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-'*(@message.length + 2)}+"
  end

  def empty_line
    "|#{' '*(@message.length + 2)}|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('')

puts banner


