# 1.
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

# 2.
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle

  def initialize(year)
    super(year)
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

# 3.
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
  def start_engine
    puts 'Ready to go!'
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

# 4.
class Vehicle
  def start_engine
    print "Ready to go!"
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super()
    " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

#5.
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

# 6.
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

# 7.
Cat.ancestors
#Ruby search first in the class Cat, later in Animal, later in Object, later in Kernel and later in BasicObject
#This time like color is in Animal it stops in Animal class, because it find the method that we need

# 8.
Cat.ancestors
#In this case it made the same look path, Cat, Animal, Object, Kernel, BasicObject, but ir doesn't find the method
#Whe we run the code it throws NoMethodError

# 9.
Bird.ancestors
# In this case it search in Bird, Flyable, Animal, Object, Kernel, BasicObject
# Like it find the method in Animal it stops there.

# 10.
module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end
