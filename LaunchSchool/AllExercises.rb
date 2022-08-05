puts "Classes And Objects 1: Find the class"

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

puts "Classes And Objects 1: Create the Class"

class Cat
end

puts "Classes And Objects 1: Create the Object"

kitty = Cat.new

puts "Classes And Objects 1: What Are You"

class Cat
	def initialize
		puts "I'm a cat!"
	end
end

puts "Classes And Objects 1: Hello, Sophie! (part 1)"

class Cat
  def initialize(name)
  	@name = name
    puts "Hello! My name is #{@name}" 
  end
end

kitty = Cat.new('Sophie')

puts "Classes And Objects 1: Hello, Sophie! (part 2)"

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


puts "Classes And Objects 1: Reader"

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


puts "Classes And Objects 1: 	Writer"

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