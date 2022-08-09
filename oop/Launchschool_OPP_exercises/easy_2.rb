# 1.
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

# 2.
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# 3.
class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# 4.
class Transform
  def initialize(words)
    @words = words
  end

  def uppercase
    @words.upcase
  end

  def self.lowercase(new_word)
    new_word.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

=begin 5.
  It will print
  ByeBye
  HelloHello
=end
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

# 6.
class Wallet
  include Comparable
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    self.amount <=> other_wallet.amount
  end
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

# 7.
class Pet
  attr_reader :name, :animal

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

class Owner
  attr_reader :name
  attr :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.length
  end

  def add_pet(pet)
    @pets << (pet)
  end
end

class Shelter
  attr :adoptions

  def initialize
    @adoptions = []
  end

  def adopt(owner, pet)
    if @adoptions.empty?
      owner.add_pet(pet)
      @adoptions << (owner)
    else
      owner_found = false
      @adoptions.each_with_index do |elem, index|
        if elem.name == owner.name
          elem.add_pet(pet)
          owner_found = true
        end
      end

      if !owner_found
        owner.add_pet(pet)
        @adoptions << (owner)
      end
    end
  end

  def print_adoptions
    @adoptions.each_with_index do |elem, index|
      puts "#{elem.name} has adopted the following pets:"
      elem.pets.each_with_index do |elemen, i|
        puts "  a #{elemen.animal} named #{elemen.name}"
      end
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

# 8.
module Mammals
  def walk(gait)
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Mammals
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    super(gait)
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Mammals
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    super(gait)
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Mammals

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    super(gait)
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

# 9.
module Walkable
  def walk(gait)
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    super(gait)
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

  def walk
    super(gait)
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

  def walk
    super(gait)
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable

  attr_reader :name

  def initialize(name, tittle)
    @name = name
    @tittle = tittle
  end

  def walk
    print "#{@tittle} "
    super(gait)
  end

  private

  def gait
    "struts"
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
byron = Noble.new("Byron", "Lord")
byron.walk
