# 1.
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    core = Array.new((@message).length, '-').join('')
    @horizontal_rule = "+--#{core}+"
  end

  def empty_line
    empty = Array.new((@message).length, ' ').join('')
    @empty_line = "|  #{empty}|"
  end

  def message_line
    "| #{@message} |"
  end
end
banner = Banner.new('To boldly go where no one has gone before.')
puts banner

=begin
2. it returns Fluffy
My name is FLUFFY.
FLUFFY
FLUFFY
we the changes it will return
Fluffy
My name is FLUFFY.
Fluffy
Fluffy
=end
class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# 3.
class Book
  attr_reader :author, :title

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

# 4.
class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# 5.
class Person
  attr_writer :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

# 6. not sure
class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# 7.
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    @mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage

# 8.
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
    super(side, side)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"

# 9.
class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color=color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur"
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# 10.
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels(num)
    @wheels = num
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
end

class Motorcycle < Vehicle
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
    super (make, model)
    @payload = payload
  end
end
