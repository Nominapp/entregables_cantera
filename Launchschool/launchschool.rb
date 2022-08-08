puts "Launchschool: 1: 1"

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

puts "Launchschool: 1: 2 - 10"

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk

puts "Launchschool: 2: 1"

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

puts "Launchschool: 2: 2"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name

puts "Launchschool: 2: 2"

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

puts "Launchschool: 2: 3"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

puts "Launchschool: 2: 4"

class Cat
  @@cats = 0

  def initialize
    @@cats += 1
  end

  def self.total
    puts @@cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

puts "Launchschool: 2: 4"

module Colors
  COLOR = "black"
end

class Cat
  include Colors

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

puts "Launchschool: 2: 5"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
    puts "I'm #{@name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty

puts "Launchschool: 2: 6"

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

puts "Launchschool: 2: 7"

class Person
  attr_writer :secret

  def share_secret
    @secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

puts "Launchschool: 2: 8 - 10"

class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

puts "Launchschool: 3: 1"

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

puts "Launchschool: 3: 2"

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    @year = year
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

puts "Launchschool: 3: 3"

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    @year = year
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

puts "Launchschool: 3: 4"

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

puts "Launchschool: 3: 4"

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow

puts "Launchschool: 3: 5"

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

puts "Launchschool: 3: 6"

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

=begin
  Cat
  |_ Animal
=end

puts "Launchschool: 3: 8"

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

puts Cat.ancestors
cat1 = Cat.new
cat1.color

=begin
  Cat
  |_ Animal
    |_ Object
      |_ PP::ObjectMixin
        |_ JSON::Ext::Generator::GeneratorMethods::Object
          |_ Kernel
            |_ BasicObject
=end

puts "Launchschool: 3: 9"

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

puts Bird.ancestors
bird1 = Bird.new('Red')
bird1.color

=begin
  Bird
  |_ Flyable
    |_ Animal
      |_ Object
        |_ PP::ObjectMixin
          |_ JSON::Ext::Generator::GeneratorMethods::Object
            |_ Kernel
              |_ BasicObject
=end

puts "Launchschool: 3: 10"

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

class Person
end

puts "Launchschool: 4: 1"

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

puts "Launchschool: 4: 2"

class Person
  attr_accessor :name, :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

puts "Launchschool: 4: 3"

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

puts "Launchschool: 4: 4"

class Person
  attr_reader :first_name
  attr_writer :first_name, :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

puts "Launchschool: 4: 5"

class Person
  attr_accessor :age

  def older_than?(other)
    age > other.age
  end

end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

puts "Launchschool: 4: 6"

class Person
  attr_reader :name

  attr_writer :name.capitalize()
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

puts "Launchschool: 4: 7"

class Person
  attr_reader :name

  def name=(name)
    @name = "Mr. "+name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

puts "Launchschool: 4: 8"

class Person
  def initialize(name)
    @name = name
  end

  def name
    "#{@name}"
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

puts "Launchschool: 4: 9"

class Person
  def age=(age)
    @age = age*2
  end

  def age
    @age*2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age

puts "Launchschool: 4: 10"

class Person
  def name
    @name = "#{@first_name} #{@last_name}"
  end

  def name=(name)
    @first_name = name.split(' ').first
    @last_name = name.split(' ').last
    return @first_name, @last_name
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

puts "Launchschool: 5: 1"

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-"+"-"*@message.length+"-+"
  end

  def empty_line
    "| "+" "*@message.length+" |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner2 = Banner.new('')
puts banner2
=begin
+--+
|  |
|  |
|  |
+--+
=end

puts "Launchschool: 5: 2"

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name  # Fluffy
puts fluffy       # My name is FLUFFY.
puts fluffy.name  # FLUFFY
puts name         # FLUFFY

puts "Launchschool: 5: 3"

class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

puts "Launchschool: 5: 4"

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

puts "Launchschool: 5: 5"

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

puts "Launchschool: 5: 6"

class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @flight_number = flight_number
  end

  def database_handle=(database_handle = Database.init)
    @database_handle = Database.init
  end
end

boing = Flight.new(123)

puts "Launchschool: 5: 7"

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    @mileage += miles
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

puts "Launchschool: 5: 8"

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    @side = side
  end

  def area
    @side ** 2
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"

puts "Launchschool: 5: 9"

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

puts "Launchschool: 5: 10"

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{@make} #{@model}"
  end
end


class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle  < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end
end

puts "Launchschool: 6: 1"

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address

puts "Launchschool: 6: 2"

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

puts "Launchschool: 6: 3"

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

puts "Launchschool: 6: 4"

class Transform
  def initialize(text)
    @text = text
  end

  def uppercase
    @text.upcase
  end

  def lowercase
    @text.downcase
  end

  def self.uppercase(text)
    text.upcase
  end

  def self.lowercase(text)
    text.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

puts "Launchschool: 6: 5"

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

puts "Launchschool: 6: 6"

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_accessor :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

puts "Launchschool: 6: 7"

class Pet
  attr_accessor :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_accessor :name, :number_of_pets, :pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
    @pets = []
  end
end

class Shelter
  def initialize
    @adoptions = []
  end

  def adopt(owner, pet)
    owner.pets << {type: pet.type, name: pet.name}
    if owner.number_of_pets == 0
      @adoptions << {owner: owner.name, pets: owner.pets}
    end
    owner.number_of_pets += 1
  end

  def print_adoptions
    @adoptions.each_with_index do |val, owner|
      puts "#{@adoptions[owner][:owner]} has has adopted the following pets:"
      @adoptions[owner][:pets].each_with_index do |val, pet|
        puts "a #{@adoptions[owner][:pets][pet][:type]} named #{@adoptions[owner][:pets][pet][:name]}"
      end
      puts "\n"
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

puts "Launchschool: 6: 8"

module Walkable
  def walk
    if @title
      puts "#{@title} #{@name} #{gait} forward"
    else
      puts "#{@name} #{gait} forward"
    end
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

puts "Launchschool: 6: 9"

class Noble
  include Walkable

  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
puts byron.name
# => "Byron"
puts byron.title
# => "Lord"

puts "Launchschool: 7: 1"

class Machine

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

puts "Launchschool: 7: 2"

class FixedArray

  def initialize(number)
    @array = Array.new(number)
  end

  def to_s
    @array.to_s
  end

  def to_a
    @array.to_a
  end

  def []=(index, value)
    raise IndexError if index > @array.size
    @array[index] = value
  end

  def [](index)
    @array.fetch(index)
  end
end


fixed_array = FixedArray.new(5)
puts "-------------------------------- Control 1 --------------------------------"
puts fixed_array[3] == nil
puts "-------------------------------- Control 2 --------------------------------"
puts fixed_array.to_a == [nil] * 5
puts "-------------------------------- Control 3 --------------------------------"

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts "-------------------------------- Control 4 --------------------------------"
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
puts "-------------------------------- Control 5 --------------------------------"

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts "-------------------------------- Control 6 --------------------------------"
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
puts "-------------------------------- Control 7 --------------------------------"

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts "-------------------------------- Control 8 --------------------------------"
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
puts "-------------------------------- Control 9 --------------------------------"

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts "-------------------------------- Control 10 --------------------------------"
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts "-------------------------------- Control 11 --------------------------------"
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts "-------------------------------- Control 12 --------------------------------"

puts fixed_array[-1] == 'd'
puts "-------------------------------- Control 13 --------------------------------"
puts fixed_array[-4] == 'c'
puts "-------------------------------- Control 14 --------------------------------"

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end
puts "-------------------------------- Control 15 --------------------------------"
begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end
puts "-------------------------------- Control 16 --------------------------------"
begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

puts "Launchschool: 7: 3"

class Student
  def initialize(*args) # 5
    #@name = name 1
    #@year = year 2
  end
end

class Graduate < Student # 3
  def initialize(name, year, parking)
    puts "#{name}, #{year}, #{parking}"
  end
end

class Undergraduate < Student # 4
  def initialize(name, year)
    puts "#{name}, #{year}"
  end
end

graduate = Graduate.new("Pepe", 2012, "A6")
undergraduate = Undergraduate.new("Pepa", 2013)

puts "Launchschool: 7: 4"

class CircularQueue
  def initialize(size)
    @buffer = Array.new(size)
    @size = size
    @rear = -1
    @front = -1
  end

  def enqueue(item)
    if @front == -1 && @rear == -1
      @front = @rear = 0
      @buffer[@rear] = item
    elsif ((@rear + 1) % @size) == @front
      dequeue
      @rear = (@rear + 1) % @size
      @buffer[@rear] = item
    else
      @rear = (@rear + 1) % @size
      @buffer[@rear] = item
    end
  end

  def dequeue
    dequeued = nil
    if @front == -1 && @rear == -1
      dequeued = @buffer[@front]
    elsif @front == @rear
      dequeued = @buffer[@front] = nil
      @front = @rear = -1
    else
      dequeued = @buffer[@front]
      @buffer[@front] = nil
      @front = (@front + 1) % @size
    end
    dequeued
  end

  def to_s
    @buffer.to_s
  end

end

queue = CircularQueue.new(3)
queue.enqueue(1)
puts queue
queue.enqueue(2)
puts queue
queue.dequeue
puts queue
queue.enqueue(3)
puts queue
queue.enqueue(4)
puts queue
queue.dequeue
puts queue
queue.enqueue(5)
puts queue
queue.enqueue(6)
puts queue
queue.enqueue(7)
puts queue
queue.dequeue
puts queue
queue.dequeue
puts queue
queue.dequeue
puts queue

=begin
queue = CircularQueue.new(3)
puts "------------- Control 1 -------------"
puts queue.dequeue == nil
puts queue
queue.enqueue(1)
queue.enqueue(2)
puts "------------- Control 2 -------------"
puts queue.dequeue == 1
puts queue
queue.enqueue(3)
queue.enqueue(4)
puts "------------- Control 3 -------------"
puts queue.dequeue == 2
puts queue
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts "------------- Control 4 -------------"
puts queue.dequeue == 5
puts queue
puts "------------- Control 5 -------------"
puts queue.dequeue == 6
puts queue
puts "------------- Control 6 -------------"
puts queue.dequeue == 7
puts queue
puts "------------- Control 7 -------------"
puts queue.dequeue == nil
puts queue

queue = CircularQueue.new(4)
puts "------------- Control 8 -------------"
puts queue.dequeue == nil
puts queue

queue.enqueue(1)
queue.enqueue(2)
puts "------------- Control 9 -------------"
puts queue.dequeue == 1
puts queue

queue.enqueue(3)
queue.enqueue(4)
puts "------------- Control 10 -------------"
puts queue.dequeue == 2
puts queue

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts "------------- Control 11 -------------"
puts queue.dequeue == 4
puts queue
puts "------------- Control 12 -------------"
puts queue.dequeue == 5
puts queue
puts "------------- Control 13 -------------"
puts queue.dequeue == 6
puts queue
puts "------------- Control 14 -------------"
puts queue.dequeue == 7
puts queue
puts "------------- Control 15 -------------"
puts queue.dequeue == nil
puts queue
=end


puts "Launchschool: 7: 5"

class Minilang
  def initialize(string)
    @string = string.split
    @register = 0
  end

  def eval
    stack = []
    if @string.include? "PRINT"
      @string.each do |command|
        if command.match? /^-?[0-9]+$/
          @register = command.to_i
        elsif command == "PUSH"
          stack.push(@register)
        elsif command == "PRINT"
          puts @register
        else
          puts "Empty stack!" if stack.empty?
          case command
          when "ADD"
            @register = @register + stack[0]
          when "SUB"
            @register = @register - stack[0]
          when "MULT"
            @register = @register * stack[0]
          when "DIV"
            @register = @register / stack[0]
          when "MOD"
            @register = @register % stack[0]
          when "POP"
            @register = stack[-1]
          else
            puts "Invalid token: #{command}"
            return
          end
          stack.pop
        end
      end
    else
      puts "(nothing printed; no PRINT commands)"
    end
  end
end

Minilang.new('PRINT').eval
# 0
Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8
Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

puts "Launchschool: 7: 6"

class GuessingGame
  def initialize
    @number = 0
  end

  def play
    guesses = 7
    guess = ""
    @number = rand(1..100)
    while guess != @number && guesses > 0
      print "\nYou have #{guesses} guesses remaining.\n" +
      "Enter a number between 1 and 100: "
      guess = gets.chomp.to_i
      until guess.between?(1, 100)
        print "Invalid guess. Enter a number between 1 and 100: "
        guess = gets.chomp.to_i
      end
      if guess == @number
        puts "\nThat's the number!"
      else
        puts(guess > @number ? "Your guess is too high." : "Your guess is too low.")
        guesses -= 1
        puts "\nYou have no more guesses. You lost!" if guesses == 0
      end
    end
  end
end

game = GuessingGame.new
game.play
game.play

puts "Launchschool: 7: 7"

class GuessingGame
  def initialize(low, high)
    @number = 0
    @low = low
    @high = high
  end

  def play
    guesses = Math.log2((@low..@high).size()).to_i + 1
    guess = ""
    @number = rand(@low..@high)
    while guess != @number && guesses > 0
      print "\nYou have #{guesses} guesses remaining.\n" +
      "Enter a number between #{@low} and #{@high}: "
      guess = gets.chomp.to_i
      until guess.between?(@low, @high)
        print "Invalid guess. Enter a number between #{@low} and #{@high}: "
        guess = gets.chomp.to_i
      end
      if guess == @number
        puts "\nThat's the number!"
      else
        puts(guess > @number ? "Your guess is too high." : "Your guess is too low.")
        guesses -= 1
        puts "\nYou have no more guesses. You lost!" if guesses == 0
      end
    end
  end
end

game = GuessingGame.new(52, 1000)
game.play
game.play

puts "Launchschool: 7: 8"

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

puts "Launchschool: 7: 9"

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.

# TODO: Complete
puts "Launchschool: 7: 10"

# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(deck)
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
    ranks = []
    @drawn.each do |card|
      ranks << card.rank
      puts "-----#{card.rank}-----"
    end
  end
end

puts "Launchschool: 8: 1"

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    @books.push(book)
  end

  def display_data
    @books.each do |book|
      puts "---------------"
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
      puts "ISBN: #{book.isbn}"
      puts "---------------"
    end
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

wrinkle_in_time.display_data

community_library.display_data

puts "Launchschool: 8: 2"

class Animal
  def initialize(*args)
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  attr_reader :diet, :superpower, :song
  def initialize(diet, superpower, song)
    super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
unicornfish.move
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
penguin.move
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')
robin.move
puts robin.song

puts "Launchschool: 8: 3"

class Person

  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    @latitude == other.latitude &&
    @longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts "#{ada.inspect} \n#{grace.inspect}"
puts ada.location == grace.location # expected: true
                                    # actual: false

puts "Launchschool: 8: 4"

class EmployeeManagementSystem
  attr_reader :employer

  def initialize(employer)
    @employer = employer
    @employees = []
  end

  def add(employee)
    if exists?(employee)
      puts "Employee serial number is already in the system."
    else
      employees.push(employee)
      puts "Employee added."
    end
  end

  alias_method :<<, :add

  def remove(employee)
    if !exists?(employee)
      puts "Employee serial number is not in the system."
    else
      employees.delete(employee)
      puts "Employee deleted."
    end
  end

  def exists?(employee)
    employees.any? { |e| e == employee }
  end

  def display_all_employees
    puts "#{employer} Employees: "

    employees.each do |employee|
      puts ""
      puts employee.to_s
    end
  end

  private

  attr_accessor :employees
end

class Employee
  attr_reader :name

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end

  def ==(other)
    serial_number == other.serial_number
  end

  def to_s
    "Name: #{name}\n" +
    "Serial No: #{abbreviated_serial_number}"
  end

  protected

  attr_reader :serial_number

  def abbreviated_serial_number
    serial_number[-4..-1]
  end
end

# Example

miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

becca = Employee.new('Becca', '232-4437-1932')
raul = Employee.new('Raul', '399-1007-4242')
natasha = Employee.new('Natasha', '399-1007-4242')

miller_contracting << becca     # => Employee added.
miller_contracting << raul      # => Employee added.
miller_contracting << raul      # => Employee serial number is already in the system.
miller_contracting << natasha   # => Employee serial number is already in the system.
miller_contracting.remove(raul) # => Employee deleted.
miller_contracting.add(natasha) # => Employee added.

miller_contracting.display_all_employees

puts "Launchschool: 8: 5"

class File
  FORMAT = ""

  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

puts "Launchschool: 8: 6"

class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def <=>(other)
    case unit
    when :km then value <=> other.as_kilometers.value
    when :mi then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end

  def ==(other)
    case unit
    when :km  then value == other.as_kilometers.value
    when :mi  then value == other.as_miles.value
    when :nmi then value == other.as_nautical_miles.value
    end
  end

  def <(other)
    case unit
    when :km  then value < other.as_kilometers.value
    when :mi  then value < other.as_miles.value
    when :nmi then value < other.as_nautical_miles.value
    end
  end

  def <=(other)
    self < other || self == other
  end

  def >(other)
    !(self <= other)
  end

  def >=(other)
    self > other || self == other
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

puts "Launchschool: 8: 7"

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount < @balance
      success = true
      @balance -= amount
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50

puts "Launchschool: 8: 8"

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

puts "Launchschool: 8: 9"

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  include Mailing
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

puts "Launchschool: 8: 10"

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise 'API key is not valid.'
    end

    rand
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      return 0 if positive + negative == 0
      positive / (positive + negative)
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when 0
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
