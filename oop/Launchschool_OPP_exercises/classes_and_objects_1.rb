# 1.
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# 2.
class Cat
end

# 3.
kitty = Cat.new

# 4.
class Cat
  def initialize
    "I'm a cat!"
  end
end

# 5.
class Cat
  def initialize(name)
    @name = name
    "Hello! My name is #{name}"
  end
end

# 6.
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{@name}"
  end
end

# 7.
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{name}"
  end
end

# 8.
class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{name}"
  end
end
kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# 9.
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{name}"
  end
end
kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# 10.
module Walkable
  def walk
    "Let's go for a walk!"
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
